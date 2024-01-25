//
//  RegionDetailDataSource.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//

import Foundation

class RegionDetailDataSource {
    func fetchLocations(for regionName: String, completion: @escaping (Result<[Location], Error>) -> Void) {
        guard let url = URL(string: "https://pinballmap.com/api/v1/region/\(regionName)/locations.json") else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }

                guard let data = data else {
                    completion(.failure(NSError(domain: "No Data", code: -1, userInfo: nil)))
                    return
                }

                do {
                    let response = try JSONDecoder().decode(LocationsResponse.self, from: data)
                    completion(.success(response.locations))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
