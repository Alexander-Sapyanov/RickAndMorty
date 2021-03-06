//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 07.02.2021.
//

import Foundation

struct CharacterModel: Codable {
    var info: CharacterInfo
    var results: [Character]
}
struct CharacterInfo: Codable {
    var count:Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct Character: Codable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String
    var episode: [String]
    var url: String
    var created: String
}

struct Origin: Codable {
    var name: String
    var url: String
}

struct Location: Codable {
    var name: String
    var url: String
}


