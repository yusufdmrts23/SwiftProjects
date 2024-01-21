//
//  HomeView.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 19.11.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: .zero) {
                Spacer()

                SubtitleText(text: viewModel.explained)

                dogListView

                Spacer()

            }
            .navigationTitle("[   Dog Brew List App   ]")
            .navigationBarTitleDisplayMode(.large)
        }
    }

    private var dogListView: some View {
        HStack(spacing: .zero) {
            NavigationLink(destination: BreedListView()) {
                TitleText(text: "START")
            }
        }
        .padding(Spacing.spacing_3)
    }
}

#Preview {
    HomeView()
}
