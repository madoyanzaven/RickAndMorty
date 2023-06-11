//
//  CharacterDetailModelBusinessRules.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 18.01.23.
//

import Foundation

protocol CharacterDetailModelBusinessRules {
    func filterEpisodes(_ episodes: [EpisodeModel], _ selectedCharacter: CharacterModel?) -> [EpisodeModel]
    func convertToEpisodeModel(_ responseModel: EpisodeResponse) -> EpisodeModel
}

extension CharacterDetailModelBusinessRules {
    func filterEpisodes(_ episodes: [EpisodeModel], _ selectedCharacter: CharacterModel?) -> [EpisodeModel] {
        guard let selectedCharacter = selectedCharacter else { return [] }

        return episodes.filter { $0.characters.contains(selectedCharacter.url)
        }
    }
    
    func convertToEpisodeModel(_ responseModel: EpisodeResponse) -> EpisodeModel {
        return EpisodeModel(
            name: responseModel.name ?? "",
            episode: responseModel.episode ?? "",
            characters: responseModel.characters ?? [])
    }
}
