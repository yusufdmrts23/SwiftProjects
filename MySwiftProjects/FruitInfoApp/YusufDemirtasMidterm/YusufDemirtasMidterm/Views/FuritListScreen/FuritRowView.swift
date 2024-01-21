//
//  FuritRowView.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 3.12.2023.
//

import SwiftUI

struct FruitRowView: View {
    var fruit: Fruit

    var body: some View {
        VStack(alignment: .leading) {
            Text(fruit.name)
                .font(.headline)
            Text("Family: \(fruit.family)")
                .font(.subheadline)

        }
    }
}
