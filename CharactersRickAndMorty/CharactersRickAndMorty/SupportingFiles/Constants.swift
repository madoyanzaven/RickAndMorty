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

extension Constants {
    enum Colors {
        static var mainGray = UIColor(red: 60/255, green: 62/255, blue: 67/255, alpha: 1)
        static var darkGray = UIColor(red: 40/255, green: 43/255, blue: 50/255, alpha: 1)
        static var mainRed = UIColor(red: 197/255, green: 73/255, blue: 56/255, alpha: 1)
        static var mainGreen = UIColor(red: 118/255, green: 201/255, blue: 88/255, alpha: 1)
        static var statusGray = UIColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1)
    }
}
