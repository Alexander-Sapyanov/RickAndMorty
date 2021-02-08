//
//  EpisodeModel.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 07.02.2021.
//

import Foundation


struct EpisodeModel: Codable {
    var info: EpisodeInfo
    var results: [EpisodeResults]
}

struct EpisodeInfo: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct EpisodeResults: Codable{
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}
