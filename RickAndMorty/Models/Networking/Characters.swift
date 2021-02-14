//
//  Character.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 14.02.2021.
//

import Foundation


struct Characters {
    let networking: Networking = Networking()
    let client: Client
    
    public init(client: Client) {
        self.client = client
    }
    
    // MARK: - Fetch characters by page number
    
    func fetchCharacters(byPageNumber pageNumber: Int, completion: @escaping (Result<CharacterModel, Error>)-> Void) {
        let path = Method.characterPage.rawValue + "\(pageNumber)"
        let urlString = networking.url(path: path)
        
        networking.performRequest(withUrlString: urlString) { (result) in
            switch result {
            case .success(let data):
                if let model: CharacterModel = self.networking.decodeJsonData(data: data) {
                    completion(.success(model))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
