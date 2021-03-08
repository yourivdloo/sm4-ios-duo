//
//  Landmark.swift
//  General practitioner
//
//  Created by Pim van Hooren on 08/03/2021.
//

import Foundation
import MapKit

struct Landmark: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
