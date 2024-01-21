//
//  SubtitleText.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 19.11.2023.
//

import SwiftUI

struct SubtitleText: View {

    private let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .padding(Spacing.spacing_1)
            .font(.title2)
    }
}

#Preview {
    SubtitleText(text: "Text")
}
