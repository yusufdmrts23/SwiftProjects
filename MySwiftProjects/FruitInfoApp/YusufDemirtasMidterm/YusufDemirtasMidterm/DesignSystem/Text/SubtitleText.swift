//
//  SubtitleText.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 2.12.2023.
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
