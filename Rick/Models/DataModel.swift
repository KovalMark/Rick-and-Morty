//
//  DataModel.swift
//  Rick
//
//  Created by Марк Коваль on 14/11/2022.
//

import Foundation

struct DataModel: Decodable {
    let results: [RickCharacter]
}

struct RickCharacter: Decodable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let location: Location
    let image: String
}

struct Location: Decodable {
    let name: String
}
