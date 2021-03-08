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
    @State private var GPsNear = [
        AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708)),
        AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: 40.741112, longitude: -73.989723)),
        AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: 40.748817, longitude: -73.985428))
        
    ]
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $region, interactionModes: [], showsUserLocation: true, annotationItems: GPsNear) { item in
                MapPin(coordinate: item.coordinate, tint: .red
                )
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: askForPermission)
            
            VStack{
                Slider(
                    value: Binding(get: {
                        self.regionSpan * 100
                    }, set: { (newVal) in
                        self.regionSpan = (newVal / 100)
                        self.sliderChanged()
                    }),
                    in: 1...20,
                    step: 1,
                    onEditingChanged: { editing in
                        isEditing = editing
                    },
                    minimumValueLabel: Text("1"),
                    maximumValueLabel: Text("20")
                ) {
                    Text("Radius")
                }.padding()
            
                Spacer()
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
                
                self.GPsNear = mapItems.map {
                    AnnotatedItem(name: $0.name ?? "Unknown place",
                                  coordinate: CLLocationCoordinate2D(latitude: $0.placemark.location?.coordinate.latitude ?? 0, longitude: $0.placemark.location?.coordinate.longitude ?? 0)
                    )
                }
            }
        }
    }
    
    struct AnnotatedItem: Identifiable {
        let id = UUID()
        var name: String
        var coordinate: CLLocationCoordinate2D
    }
}

struct GPMapView_Previews: PreviewProvider {
    static var previews: some View {
        GPMapView()
    }
}
