//
//  HomeViewModel.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 19.11.2023.
//

import Foundation

class HomeViewModel: ObservableObject {

    @Published var buttonTitle = "START"
    @Published var title = "Dog Brew List App"
    @Published var explained = "Tap On Start Button To See Breed List"

}
