//
//  CharacterListResponse.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation

struct CharacterListResponse: Decodable {
    let info: InfoResponse
    let results: [CharacterResponse]
}

struct InfoResponse: Decodable {
    let count: Int
    let pages: Int
}

struct CharacterResponse: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
    let url: String
    let createdData: String

    enum CodingKeys: String, CodingKey {
        case id, name, status, species, type, gender, image, url
        case createdData = "created"
    }
}
