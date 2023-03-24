//
//  CharacterListViewModelAssembly.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 23.01.23.
//

// TODO we should seperate

import Foundation
import Swinject

final class CharacterListViewModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CharacterListViewModel.self) { r in
            let inputs = CharacterListInputs(characterList: r.resolve((CharacterListServicing.self))!)

            return CharacterListViewModel(inputs: inputs)
        }
    }
}
