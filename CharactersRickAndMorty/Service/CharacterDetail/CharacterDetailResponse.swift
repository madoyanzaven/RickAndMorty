//
//  CharacterDetailResponse.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 18.01.23.
//

import Foundation

struct CharacterDetailResponse: Decodable {
    let results: [EpisodeResponse]
}

struct EpisodeResponse: Decodable {
    let id: Int
    let name: String?
    let episode: String?
    let characters: [String]?
}
