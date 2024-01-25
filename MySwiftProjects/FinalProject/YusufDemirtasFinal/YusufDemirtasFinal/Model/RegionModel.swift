//
//  RegionModel.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//
import Foundation

struct Region: Identifiable, Decodable {
    let id: Int
    let name: String
    let state: String
    let motd: String?

    enum CodingKeys: String, CodingKey {
        case id, name, state
        case motd = "motd"
    }
}

struct RegionsResponse: Decodable {
    let regions: [Region]
}
