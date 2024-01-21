//
//  DogDataSource.swift
//  DogBrewList
//
//  Created by Yusuf Demirtaş on 20.11.2023.
//

import Foundation

struct DogDataSource {

    private let baseURL = "https://dog.ceo/api"
    var delegate: DogDataSourceDelegate?

    func loadBreedList() {
        let session = URLSession.shared

        if let url = URL(string: "\(baseURL)/breeds/list") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) { data, _, _ in
                guard let data else { return }
                let decoder = JSONDecoder()
                do {
                    let breedResponse = try decoder.decode(DogBreed.self, from: data)
                    DispatchQueue.main.async {
                        delegate?.breedListLoaded(breedList: breedResponse.message)
                    }
                } catch {
                    print(error)
                }
            }
            dataTask.resume()
        }
    }
}
