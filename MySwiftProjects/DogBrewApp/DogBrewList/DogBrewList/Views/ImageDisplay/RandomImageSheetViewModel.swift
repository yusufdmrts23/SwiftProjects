//
//  RandomImageSheetViewModel.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 21.11.2023.
//
import Foundation

class RandomImageSheetViewModel: ObservableObject {
    @Published var randomImageURL: String?
    private let breed: String
    private let randomImageDataSource = RandomImageDataSource()

    init(breed: String) {
        self.breed = breed
        loadRandomImage()
    }

    private func loadRandomImage() {
        randomImageDataSource.loadRandomImage(for: breed) { [weak self] imageURL in
            self?.randomImageURL = imageURL
        }
    }
}
