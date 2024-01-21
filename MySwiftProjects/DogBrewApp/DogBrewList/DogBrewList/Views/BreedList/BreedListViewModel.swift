//
//  BreedListViewModel.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 20.11.2023.
//
import Foundation

class BreedListViewModel: ObservableObject {

    @Published var isLoading = true
    @Published var dogListTitle = "List Of Dog Breeds"
    @Published var breedList: [String] = []
    private var dataSource = DogDataSource()
    @Published var infoViewPresented = false

    init() {
        dataSource.delegate = self
    }
    func infoTapped() {
        infoViewPresented = true
    }
    func loadBreedList() {
            dataSource.loadBreedList()
        }
}

extension BreedListViewModel: DogDataSourceDelegate {
    func breedListLoaded(breedList: [String]) {
        isLoading = false
        self.breedList = breedList
    }
}
