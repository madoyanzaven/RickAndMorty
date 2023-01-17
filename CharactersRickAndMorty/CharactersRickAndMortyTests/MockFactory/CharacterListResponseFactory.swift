//
//  CharacterListResponseFactory.swift
//  CharactersRickAndMortyTests
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation

@testable import CharactersRickAndMorty

final class CharacterListResponseFactory {
    static func createUserResponse() -> CharactersRickAndMorty.CharacterListResponse {
        return CharacterListResponse(
            info: InfoResponse(count: 1, pages: 1),
            results: [
                CharacterResponseFactory.create(),
                CharacterResponseFactory.create()
            ])
    }
}
