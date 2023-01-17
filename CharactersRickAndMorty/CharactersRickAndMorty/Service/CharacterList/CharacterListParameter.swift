//
//  CharacterListParameter.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation

struct CharacterListParameter: Routing {
    let page: Int

    var api: Constants.API {
        return .character
    }

    var parameters: [String: Any] {
        let parameters: [String: Any] = [
            "page": page
        ]

        return parameters
    }
}
