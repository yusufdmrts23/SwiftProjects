//
//  Furit.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 3.12.2023.
//
import Foundation

struct Fruit: Identifiable, Codable {
    let id: UUID
    let name: String
    let family: String
    let genus: String


    init(from decoder: Decoder) throws {
        id = UUID()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        family = try container.decode(String.self, forKey: .family)
        genus = try container.decode(String.self, forKey: .genus)
    }

    enum CodingKeys: String, CodingKey {
        case name, family, genus
    }
}
