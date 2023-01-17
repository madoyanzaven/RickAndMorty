//
//  CharacterListBusinessRules.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation

protocol CharacterListBusinessRules {
    func isPageNotOffset(_ currentPage: Int, _ totalPage: Int) -> Bool
}

extension CharacterListBusinessRules {
    func isPageNotOffset(_ currentPage: Int, _ totalPages: Int) -> Bool {
        return totalPages >= currentPage
    }
}
