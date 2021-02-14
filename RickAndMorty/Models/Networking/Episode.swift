//
//  Episodes.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 14.02.2021.
//

import Foundation


struct Episode {
    let networking: Networking = Networking()
    let client: Client
    
    public init(client: Client) {
        self.client = client
    }

    // MARK: - Fetch episodes by page number
    
    func fetchEpisodes(byPageNumber pageNumber: Int, completion: @escaping (Result<EpisodeModel,Error>) -> Void) {
        let path = Method.episodePage.rawValue + "\(pageNumber)"
        let urlString = networking.url(path: path)
        
        networking.performRequest(withUrlString: urlString) { (result) in
            switch result {
            case .success(let data):
                if let model: EpisodeModel = self.networking.decodeJsonData(data: data) {
                    completion(.success(model))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
