//
//  RegionDataSource.swift
//  YusufDemirtasFinal
//
//  Created by Yusuf Demirtaş on 22.01.2024.
//

import Foundation

struct RegionDataSource {
    func fetchRegions(completion: @escaping ([Region]?, Error?) -> Void) {
        guard let url = URL(string: "https://pinballmap.com/api/v1/regions.json") else {
            completion(nil, NSError(domain: "Invalid URL", code: -1, userInfo: nil))
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, error)
                    return
                }

                guard let data = data else {
                    completion(nil, NSError(domain: "No Data", code: -1, userInfo: nil))
                    return
                }

                do {
                    let response = try JSONDecoder().decode(RegionsResponse.self, from: data)
                    let sortedRegions = response.regions.sorted { $0.name < $1.name }
                    completion(sortedRegions, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }.resume()
    }
}
