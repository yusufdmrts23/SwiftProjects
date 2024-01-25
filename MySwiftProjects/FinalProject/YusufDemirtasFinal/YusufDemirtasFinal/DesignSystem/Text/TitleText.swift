//
//  TitleText.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 21.01.2024.
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
            .font(.title2)
            .padding(.vertical, Spacing.spacing_3)
            .padding(.horizontal, Spacing.spacing_5)
            .fontWeight(.bold)
    }
}

#Preview {
    TitleText(text: "Test")
}
