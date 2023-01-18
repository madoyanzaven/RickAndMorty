//
//  CharacterModelFactory.swift
//  CharactersRickAndMortyTests
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation

@testable import CharactersRickAndMorty

final class CharacterModelFactory {
    static func create(id: Int,
                       name: String = "",
                       imagePath: String = "",
                       status: String = "",
                       species: String = "",
                       location: Location = Location(name: ""),
                       origin: Origin = Origin(name: ""),
                       url: String = ""
    ) -> CharactersRickAndMorty.CharacterModel {
        return CharacterModel(id: id,
                              name: name,
                              imagePath: imagePath,
                              status: status,
                              species: species,
                              location: location,
                              origin: origin,
                              url: url)
    }
}
