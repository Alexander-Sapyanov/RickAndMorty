//
//  Characters.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 06.02.2021.
//

import Foundation

struct InfoCharacterModel: Codable {
    
    let info: Info
    let results: [CharacterModel]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let nex: String?
    let prev: String?
}

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: CharacterOriginModel
    let location: CharacterLocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

public struct CharacterOriginModel: Codable {
    public let name: String
    public let url: String
}

public struct CharacterLocationModel: Codable {
    public let name: String
    public let url: String
}
