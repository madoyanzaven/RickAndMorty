//
//  CharacterResponseFactory.swift
//  CharactersRickAndMortyTests
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation

@testable import CharactersRickAndMorty

final class CharacterResponseFactory {
    static func create() -> CharactersRickAndMorty.CharacterResponse {
        return CharacterResponse(id: 1,
                                 name: "",
                                 status: "",
                                 species: "",
                                 type: "",
                                 gender: "",
                                 image: "",
                                 url: nil,
                                 createdData: nil,
                                 location: nil,
                                 origin: nil)

    }
}
