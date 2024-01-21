//
//  FuritDetailSource.swift
//  YusufDemirtasMidterm
//
//  Created by Yusuf Demirtaş on 3.12.2023.
//
import Foundation

class FruitDetailSource {
    func fetchFruitDetail(fruitId: UUID, completion: @escaping (Result<FruitDetail, Error>) -> Void) {
        guard let url = URL(string: "https://fruityvice.com/api/fruit/\(fruitId)") else {
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
                let fruitDetail = try JSONDecoder().decode(FruitDetail.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(fruitDetail))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
