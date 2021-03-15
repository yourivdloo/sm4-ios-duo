//
//  GPMapView.swift
//  General practitioner
//
//  Created by Pim van Hooren on 05/03/2021.
//

import SwiftUI
import MapKit

struct GPMapView: View {
    var locationManager = CLLocationManager()
    @State private var regionSpan = 0.05
    @State private var isEditing = false
    @State private var GPsNear = [AnnotatedItem]()
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        GeometryReader{ geo in
            ZStack{
                Map(coordinateRegion: $region, interactionModes: [], showsUserLocation: true, annotationItems: GPsNear, annotationContent: { pin in
                    MapAnnotation(coordinate: pin.coordinate,
                                  content: {
                                    PinButtonView(pin: pin)
                                  })
                })
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: askForPermission)
                
                //                Circle()
                //                    .fill(Color.blue)
                //                    .frame(width: geo.size.width, height: geo.size.height)
                //                    .opacity(0.15)
                //                .onTapGesture {
                //                    print("Circle tapped!")
                //                }
                //                .allowsHitTesting(false)
                
                VStack{
                    Slider(
                        value: Binding(get: {
                            self.regionSpan * 100
                        }, set: { (newVal) in
                            self.regionSpan = (newVal / 100)
                            self.sliderChanged()
                        }),
                        in: 0.9...45.045,
                        step: 1,
                        onEditingChanged: { editing in
                            isEditing = editing
                        },
                        minimumValueLabel: Text("1"),
                        maximumValueLabel: Text("25 km")
                    ) {
                        Text("Radius")
                    }.padding()
                    Spacer()
                }
            }
        }
    }
    
    func sliderChanged(){
        let coords = self.region.center
        let span = MKCoordinateSpan(latitudeDelta: self.regionSpan, longitudeDelta: self.regionSpan)
        self.region = MKCoordinateRegion(center: coords, span: span)
    }
    
    func askForPermission(){
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            let dummyLocation = CLLocation(latitude: 40.741112, longitude: -73.989723)
            let locValue = self.locationManager.location ?? dummyLocation
            let locCoords:CLLocationCoordinate2D = locValue.coordinate
            print("CURRENT LOCATION = \(locValue.coordinate.latitude) \(locValue.coordinate.longitude)")
            
            let coordinate = CLLocationCoordinate2D(
                latitude: locCoords.latitude, longitude: locCoords.longitude)
            let span = MKCoordinateSpan(latitudeDelta: self.regionSpan, longitudeDelta: self.regionSpan)
            self.region = MKCoordinateRegion(center: coordinate, span: span)
            
            self.getNearbyGPs()
        })
    }
    
    func getNearbyGPs(){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "General practitioner"
        request.region = self.region
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            if let response = response {
                let mapItems = response.mapItems
                self.GPsNear.removeAll()
                
                self.GPsNear = mapItems.map {
                    AnnotatedItem(name: $0.name ?? "Unknown place", phoneNumber: $0.phoneNumber ?? "No phone number", url: $0.url ?? URL(string: "https://www.google.com")!,
                                  coordinate: CLLocationCoordinate2D(latitude: $0.placemark.location?.coordinate.latitude ?? 0, longitude: $0.placemark.location?.coordinate.longitude ?? 0)
                    )
                }
            }
        }
    }
}

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var phoneNumber: String
    var url : URL
    var coordinate: CLLocationCoordinate2D
}

struct PinButtonView: View {
    @Environment(\.openURL) var openURL
    @State private var showingDetailScreen = false
    @State var pin: AnnotatedItem
    
    var body: some View {
        Button(action: {
            showingDetailScreen.toggle()
        }) {
            Image(systemName: "mappin")
                .padding()
                .foregroundColor(.red)
                .font(.title)
        }
        .actionSheet(isPresented: $showingDetailScreen){
            ActionSheet(title: Text(pin.name), buttons: [
                .default(Text("Call practitioner")) {
                    callNumber()
                },
                .default(Text("Visit website")) { visitSite() },
                .cancel()
            ])
            
        }
    }
    
    func callNumber(){
        if let phoneCallURL = URL(string: "tel://\(pin.phoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    func visitSite(){
        openURL(pin.url)
    }
}

struct GPMapView_Previews: PreviewProvider {
    static var previews: some View {
        GPMapView()
    }
}
