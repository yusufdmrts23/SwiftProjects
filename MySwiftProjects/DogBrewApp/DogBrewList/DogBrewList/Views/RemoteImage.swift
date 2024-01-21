// RemoteImage.swift

import SwiftUI

struct RemoteImage: View {
    let url: String
    var body: some View {
        if let imageURL = URL(string: url), let imageData = try? Data(contentsOf: imageURL),
           let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
        }
    }
}
