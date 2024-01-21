// RandomImageDataSource.swift

import Foundation

struct RandomImageDataSource {
    func loadRandomImage(for breed: String, completion: @escaping (String?) -> Void) {
        let session = URLSession.shared

        if let url = URL(string: "https://dog.ceo/api/breed/\(breed)/images/random") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")

            let dataTask = session.dataTask(with: request) { data, _, _ in
                guard let data = data else {
                    completion(nil)
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let imageResponse = try decoder.decode(DogImageResponse.self, from: data)
                    let imageURL = imageResponse.message
                    DispatchQueue.main.async {
                        completion(imageURL)
                    }
                } catch {
                    print(error)
                    completion(nil)
                }
            }
            dataTask.resume()
        }
    }
}
