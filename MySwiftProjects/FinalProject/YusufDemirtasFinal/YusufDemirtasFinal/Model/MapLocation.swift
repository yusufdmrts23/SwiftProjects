//
//  MapLocation.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//
import SwiftUI
import MapKit

import Foundation
struct MapLocation: Identifiable {
    let id = UUID()
    let location: Location
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: location.lat, longitude: location.lon)
    }
}
