//
//  TItleText.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 19.11.2023.
//

import SwiftUI

struct TitleText: View {

    private let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .lineLimit(4)
            .foregroundColor(.buttonText)
            .font(.title2)
            .padding(.vertical, Spacing.spacing_3)
            .padding(.horizontal, Spacing.spacing_5)
            .fontWeight(.bold)
            .overlay {
                RoundedRectangle(cornerRadius: Radius.radius_4)
                    .stroke(.buttonBorder, lineWidth: 5)
            }
    }
}

#Preview {
    TitleText(text: "Test")
}
