//
//  LocationModel.swift
//  ShiftPilot1
//
//  Created by Aiden Yang on 2024/4/23.
//

import Foundation
import MapKit

struct UserLocation: Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double

    // Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
