//
//  CharacterModelFactory.swift
//  CharactersRickAndMortyTests
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation

@testable import CharactersRickAndMorty

final class CharacterModelFactory {
    static func create() -> CharactersRickAndMorty.CharacterModel {
        return CharacterModel(name: "",
                              imagePath: "",
                              status: "",
                              species: "",
                              location: Location(name: ""),
                              origin: Origin(name: ""))
    }
}
