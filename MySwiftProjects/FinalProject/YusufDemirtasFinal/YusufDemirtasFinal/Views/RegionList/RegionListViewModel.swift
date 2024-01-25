//
//  RegionListViewModel.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//

import SwiftUI
import Foundation

class RegionListViewModel: ObservableObject {
    @Published var regions: [Region] = []
    @Published var isLoading = false
    private var dataSource = RegionDataSource()

    func loadRegions() {
        isLoading = true

        dataSource.fetchRegions { [weak self] regions, error in
            self?.isLoading = false
            if let regions = regions {
                self?.regions = regions
            } else {
                print("Error fetching regions: \(error?.localizedDescription ?? "Unknown error")")
            }
        }
    }
}
extension RegionListViewModel: RegionDataSourceDelegate {
    func loadRegions(regions: [Region]) {
        isLoading = false
        self.regions = regions
    }
}
