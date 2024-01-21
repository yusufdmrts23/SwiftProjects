//
//  FuritDetail.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 3.12.2023.
//

import Foundation

struct FruitDetail: Identifiable, Codable {
    let id: UUID
    let name: String
    let genus: String
    let family: String
    let order: String

    init(from decoder: Decoder) throws {
        id = UUID()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        genus = try container.decode(String.self, forKey: .genus)
        family = try container.decode(String.self, forKey: .family)
        order = try container.decode(String.self, forKey: .order)
    }

    enum CodingKeys: String, CodingKey {
        case name, genus, family, order
    }
}
