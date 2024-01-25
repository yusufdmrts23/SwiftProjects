//
//  RegionDetailScreenViewModel.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//

import Foundation

import MapKit

class RegionDetailScreenViewModel: ObservableObject {
    @Published var locations: [Location] = []
    @Published var isLoading = false
    private var dataSource = RegionDetailDataSource()

    func loadLocations(for regionName: String) {
        isLoading = true
        dataSource.fetchLocations(for: regionName) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let locations):
                self?.locations = locations
            case .failure(let error):
                print("Error fetching locations: \(error)")
            }
        }
    }
    
}
