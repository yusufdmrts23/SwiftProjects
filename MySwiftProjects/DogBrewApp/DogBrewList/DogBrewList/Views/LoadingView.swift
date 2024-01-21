//
//  LoadingView.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 20.11.2023.
//

import SwiftUI

struct LoadingView: View {

    var body: some View {
        VStack(spacing: Spacing.spacing_1) {
            ProgressView()
            Text("Loading...")
        }
    }
}

#Preview {
    LoadingView()
}
