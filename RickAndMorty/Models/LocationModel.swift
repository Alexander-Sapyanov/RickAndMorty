//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by Alexander  Sapianov on 07.02.2021.
//

import Foundation

struct LocationModel: Codable {
    var info: LocationInfo
    var results: [LocationResults]
}

struct LocationInfo: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}

struct LocationResults: Codable {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
}

struct FilterLocations {
    var name: String
    var type: String
    var dimension: String
}
