//
//  FuritDataSource.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 3.12.2023.
//

import Foundation

class FruitDataSource {
    func fetchFruits(maxCalories: Int, completion: @escaping (Result<[Fruit], Error>) -> Void) {
        guard let url = URL(string: "https://fruityvice.com/api/fruit/calories?max=\(maxCalories)") else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -2, userInfo: nil)))
                return
            }

            do {
                let fruits = try JSONDecoder().decode([Fruit].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(fruits))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
