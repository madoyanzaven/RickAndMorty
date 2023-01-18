//
//  CharacterListBusinessRules.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation

protocol CharacterListBusinessRules {
    func isPageNotOffset(_ currentPage: Int, _ totalPage: Int) -> Bool
    func convertToCharacterModel(_ responseModel: CharacterResponse) -> CharacterModel
}

extension CharacterListBusinessRules {
    func isPageNotOffset(_ currentPage: Int, _ totalPages: Int) -> Bool {
        return totalPages >= currentPage
    }
    
    func convertToCharacterModel(_ responseModel: CharacterResponse) -> CharacterModel {
        return CharacterModel(
            id: responseModel.id,
            name: responseModel.name ?? "",
            imagePath: responseModel.image,
            status: responseModel.status ?? "",
            species: responseModel.species ?? "",
            location: Location(
                name: responseModel.location?.name),
            origin: Origin(
                name: responseModel.origin?.name),
            url: responseModel.url ?? ""
        )
    }
}
