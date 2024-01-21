//
//  NiceTitleText.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 2.12.2023.
//

import SwiftUI

struct NiceTitleText: View {

    private let text: String

    init(text: String) {
        self.text = text
    }

    var body: some View {
        Text(text)
            .padding(Spacing.spacing_1)
            .font(.title2)
            .foregroundColor(.black)
            .padding(.vertical, Spacing.spacing_1)
            .padding(.horizontal, Spacing.spacing_5)
            .overlay {
            RoundedRectangle(cornerRadius: 3)
                    .stroke(.black, lineWidth: 3)
            }
            .lineLimit(2)
            .padding(Spacing.spacing_1)
            .background(.red)
            .overlay {
            RoundedRectangle(cornerRadius: 3)
                    .stroke(.black, lineWidth: 3)
            }
            .font(.title3).bold()
            .padding(.vertical, 1)
            .padding(.horizontal, 1)
    }
}

#Preview {
    NiceTitleText(text: "Text")
}
