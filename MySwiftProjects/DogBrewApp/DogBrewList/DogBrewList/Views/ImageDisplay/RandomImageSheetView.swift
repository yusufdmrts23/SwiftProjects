// RandomImageSheetView.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 21.11.2023.
//
import SwiftUI

struct RandomImageSheetView: View {
    @ObservedObject private var viewModel: RandomImageSheetViewModel

    var breed: String

    init(breed: String) {
        viewModel = RandomImageSheetViewModel(breed: breed)
        self.breed = breed
    }

    var body: some View {
        VStack {
            if let imageURL = viewModel.randomImageURL {
                RemoteImage(url: imageURL)
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                LoadingView()
            }
        }
        .navigationBarTitle(breed, displayMode: .inline)
    }
}
