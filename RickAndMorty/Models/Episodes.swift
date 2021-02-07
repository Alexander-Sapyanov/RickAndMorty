//
//  Episodes.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 06.02.2021.
//

import Foundation

struct InfoEpisodeModel: Codable {
    let info: Info
    let results: [EpisodeModel]
    
}

struct EpisodeModel: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, name, episode, characters, url, created
        case airDate = "air_date"
    }
}
