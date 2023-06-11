//
//  CharacterResponseFactory.swift
//  CharactersRickAndMortyTests
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation

@testable import CharactersRickAndMorty

final class CharacterResponseFactory {
    static func create(id: Int = 1,
                       name: String = "",
                       status: String = "",
                       species: String = "",
                       type: String = "",
                       gender: String = "",
                       image: String = "",
                       url: String? = nil,
                       createdData: String? = nil,
                       location: LocationResponse? = nil,
                       origin: OriginResponse? = nil) -> CharactersRickAndMorty.CharacterResponse {
        return CharacterResponse(id: id,
                                 name: name,
                                 status: status,
                                 species: species,
                                 type: type,
                                 gender: gender,
                                 image: image,
                                 url: url,
                                 createdData: createdData,
                                 location: location,
                                 origin: origin)
        
    }
}
