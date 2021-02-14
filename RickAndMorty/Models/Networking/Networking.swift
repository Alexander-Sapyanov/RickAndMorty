//
//  Networking.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 14.02.2021.
//

import Foundation

enum Method: String {
    case characterPage = "character/?page="
    case character = "character/"
    case locationPage = "location/?page="
    case episodePage = "episode/?page="
    case episode = "episode/"
    case location = "location/"
    
}

struct Networking {
    private let baseUrlString = "https://rickandmortyapi.com/api/"
    
    typealias  completionHandlerData = (Result<Data, Error>) -> Void
    typealias completionHandlerDataAndResponse = (Result<(Data, URLResponse), Error>) -> Void
    
    
    // MARK: - Functions
    func url(path: String) -> String {
        return baseUrlString + path
    }
    
    func performRequest(withUrlString urlString: String, completion: @escaping completionHandlerData) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) {(data, response, error) in
            if let data = data {
                completion(.success(data))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    func decodeJsonData<T: Codable>(data: Data)-> T? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

struct Client {
    init() {}
    
    func episode() -> Episode {
        let episode = Episode(client: self)
        return episode
    }
    
    func character() -> Characters {
        let character = Characters(client: self)
        return character
    }
}
