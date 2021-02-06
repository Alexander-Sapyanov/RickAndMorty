//
//  Location.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 06.02.2021.
//

import Foundation

struct InfoLocationModel: Codable {
    let info: Info
    let results: [LocationModel]
}

struct LocationModel: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    
}

struct LocationFilter {
    let name: String
    let type: String
    let dimension: String
}
