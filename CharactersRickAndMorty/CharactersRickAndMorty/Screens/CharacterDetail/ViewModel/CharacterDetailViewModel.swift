//
//  CharacterDetailViewModel.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation
import RxSwift
import RxRelay

final class CharacterDetailViewModel: CharacterDetailModelBusinessRules {
    private weak var coordinator: MainCoordinator!
    let disposeBag = DisposeBag()
    let displayPublishRelay = PublishRelay<Void>()
    
    private let inputs: CharacterDetailInputs
    private var selectedCharacter: CharacterModel!
    private var episodes: [EpisodeModel] = []
    
    var navigationTitle: String {
        return "Character Detail"
    }
    var episodesModel: [EpisodeModel] {
        return episodes
    }
    
    init(inputs: CharacterDetailInputs) {
        self.inputs = inputs
    }

    func setup(with model: CharacterModel, _ coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.selectedCharacter = model
    }
    
    func loadEpisodeList() {
        let parameter = CharacterDetailParameter()
        inputs.characterDetail.fetch(routing: parameter).observe(on: MainScheduler.instance).subscribe(
            onSuccess: { [weak self] response in
                guard let strongSelf = self else { return }
                let allEpisodes = response.results.map {
                    strongSelf.convertToEpisodeModel($0)
                }
                strongSelf.episodes = strongSelf.filterEpisodes(allEpisodes, strongSelf.selectedCharacter)
                strongSelf.displayPublishRelay.accept(())
            },
            onFailure: { [weak self] error in
                self?.coordinator?.showAlert(with: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
}

struct CharacterDetailInputs {
    let characterDetail: CharacterDetailServicing
}
