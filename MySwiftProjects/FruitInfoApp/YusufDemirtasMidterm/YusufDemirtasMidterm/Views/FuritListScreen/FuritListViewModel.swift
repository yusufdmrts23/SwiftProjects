//
//  FuritListViewModel.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 3.12.2023.
//

import Foundation

class FruitListViewModel: ObservableObject {
    @Published var fruits: [Fruit] = []
    @Published var isLoading = false
    private var service = FruitDataSource()

    func searchFruits(maxCalories: Int) {
        isLoading = true
        service.fetchFruits(maxCalories: maxCalories) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let fruits):
                    self?.fruits = fruits
                case .failure:
                    self?.fruits = []
                }
            }
        }
    }
}
