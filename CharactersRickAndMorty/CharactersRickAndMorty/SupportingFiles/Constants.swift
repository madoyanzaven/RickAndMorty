//
//  Constants.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import UIKit

enum Constants {
    enum API {
        case character

        var path: String {
            switch self {
            case .character :
                return "/api/character"
            }
        }

        var jsonFile: String {
            switch self {
            case .character:
                return "UserList"
            }
        }
    }
}

extension Constants {
    enum BaseUrl {
        static var rickandmortyapi = "https://rickandmortyapi.com"
    }
}

extension Constants {
    enum Foundation {
        static var limitPageCount = 10
    }
}
