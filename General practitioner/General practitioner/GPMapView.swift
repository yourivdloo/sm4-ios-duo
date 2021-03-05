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
    private var GPsNear = [
        AnnotatedItem(name: "Times Square", coordinate: .init(latitude: 40.75773, longitude: -73.985708)),
                AnnotatedItem(name: "Flatiron Building", coordinate: .init(latitude: 40.741112, longitude: -73.989723)),
                AnnotatedItem(name: "Empire State Building", coordinate: .init(latitude: 40.748817, longitude: -73.985428))
        ]
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    var body: some View {
        Map(coordinateRegion: $region, interactionModes: [], showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: GPsNear) { item in
                    MapMarker(coordinate: item.coordinate, tint: .red)
                }
                .edgesIgnoringSafeArea(.all)
                .onAppear(perform: askForPermission)
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
            let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
            self.region = MKCoordinateRegion(center: coordinate, span: span)
            })
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
