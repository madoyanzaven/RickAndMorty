//
//  CharacterListParameter.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation

struct CharacterListParameter: Routing {
    let page: Int
    let status: CaracterStatus?

    var api: Constants.API {
        return .characterList
    }

    var parameters: [String: Any] {
        var parameters: [String: Any] = [
            "page": page
        ]
        if let status = status {
            parameters["status"] = status.statusParameter
        }

        return parameters
    }
}
