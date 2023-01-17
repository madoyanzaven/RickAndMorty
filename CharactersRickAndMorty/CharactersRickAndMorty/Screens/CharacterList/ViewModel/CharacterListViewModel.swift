//
//  CharacterListViewModel.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import RxSwift
import RxRelay

final class CharacterListViewModel {
    weak var coordinator : MainCoordinator!
    let updatedIndexPathBehaviorRelay: BehaviorRelay<[IndexPath]?> = BehaviorRelay(value: nil)
    let disposeBag = DisposeBag()
    var isLoading = false

    private var totalPages = 1
    private var currentPage = 1
    private let inputs: CharacterListInputs
    private var characters: [CharacterModel] = []
    private var indexPaths: [IndexPath] = []

    var navigationTitle: String {
        return "Character List"
    }
    var charactersModel: [CharacterModel] {
        return characters
    }
    var pageNotOffset: Bool {
        return totalPages >= currentPage
    }

    init(inputs: CharacterListInputs) {
        self.inputs = inputs
    }

    func loadCharacterList() {
        isLoading = true
        let parameter = CharacterListParameter(page: currentPage)
        inputs.characterList.fetch(routing: parameter).observe(on: MainScheduler.instance).subscribe(
            onSuccess: { [weak self] response in
                guard let strongSelf = self else { return }

                let models = response.results.map { CharacterModel(name: $0.name)}
                strongSelf.totalPages = response.info.pages
                strongSelf.isLoading = false
                strongSelf.currentPage += 1
                guard !strongSelf.charactersModel.isEmpty else {
                    strongSelf.characters.append(contentsOf: models)
                    strongSelf.updatedIndexPathBehaviorRelay.accept(strongSelf.indexPaths)
                    return
                }
                self?.updateCells(with: models)
            },
            onFailure: { [weak self] error in
                self?.isLoading = false
                self?.coordinator?.showAlert(with: error.localizedDescription)
            }).disposed(by: disposeBag)
    }

    private func updateCells(with characters: [CharacterModel]) {
        indexPaths.removeAll()
        let oldCharacterCount = charactersModel.count
        let newRows = oldCharacterCount + characters.count

        for row in oldCharacterCount..<newRows {
            indexPaths.append(IndexPath(row: row, section: 0))
        }
        self.characters.append(contentsOf: characters)
        self.updatedIndexPathBehaviorRelay.accept(self.indexPaths)
    }
}

struct CharacterListInputs {
    let characterList: CharacterListServicing
}
