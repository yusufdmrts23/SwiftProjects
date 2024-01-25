//
//  LocationModel.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//

import Foundation
import MapKit

struct Location: Identifiable, Decodable, Equatable {
    let id: Int
    let name: String
    let street: String
    let city: String
    let state: String
    let zip: String
    let lat: Double
    let lon: Double
    let machineCount: Int

    enum CodingKeys: String, CodingKey {
        case id, name, street, city, state, zip, lat, lon
        case machineCount = "num_machines"
    }

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}


struct LocationsResponse: Decodable {
    let locations: [Location]
}
