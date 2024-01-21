//
//  BreedListView.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 20.11.2023.
//

import SwiftUI

struct BreedListView: View {
    @StateObject private var viewModel = BreedListViewModel()
    @State private var selectedBreed: String?
    @State private var showBreedImage = false

    var body: some View {
        VStack(spacing: .zero) {
           TitleDogListText(text: viewModel.dogListTitle)

            if viewModel.isLoading {
                LoadingView()
            } else {
                List(viewModel.breedList, id: \.self) { breed in
                    Button(breed) {
                        viewModel.loadBreedList()
                        self.selectedBreed = breed
                        self.showBreedImage = true
                    }
                }
            }
        }
        .onAppear {
            viewModel.loadBreedList()
        }
        .sheet(isPresented: $showBreedImage) {
            if let breed = selectedBreed {
                RandomImageSheetView(breed: breed)
            }
        }
    }
}

#Preview {
    BreedListView()
}
