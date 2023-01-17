//
//  CharacterListViewModel.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import RxSwift
import RxRelay

final class CharacterListViewModel: CharacterListBusinessRules {
    weak var coordinator : MainCoordinator!
    let updatedIndexPathBehaviorRelay: BehaviorRelay<[IndexPath]?> = BehaviorRelay(value: nil)
    let disposeBag = DisposeBag()
    var isLoading = false

    private var totalPages = 1
    private var currentPage = 1
    private var statusParam: CaracterStatus? = nil
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
        return isPageNotOffset(currentPage, totalPages)
    }

    init(inputs: CharacterListInputs) {
        self.inputs = inputs
    }

    func loadCharacterList() {
        isLoading = true
        let parameter = CharacterListParameter(
            page: currentPage,
            status: statusParam)
        inputs.characterList.fetch(routing: parameter).observe(on: MainScheduler.instance).subscribe(
            onSuccess: { [weak self] response in
                guard let strongSelf = self else { return }

                let models = response.results.map {
                    CharacterModel(
                    name: $0.name ?? "",
                    imagePath: $0.image,
                    status: $0.status ?? "",
                    species: $0.species ?? "",
                    location: Location(
                        name: $0.location?.name),
                    origin: Origin(
                        name: $0.origin?.name)
                    )
                }
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

    func hundleSegmentAction(with status: CaracterStatus?) {
        statusParam = status
        currentPage = 1
        characters.removeAll()
        indexPaths.removeAll()
        loadCharacterList()
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
