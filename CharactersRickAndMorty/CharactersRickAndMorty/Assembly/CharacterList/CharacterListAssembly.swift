//
//  CharacterListAssembly.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import Swinject

final class CharacterListAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CharacterListViewModel.self) { r in
            let inputs = CharacterListInputs(characterList: r.resolve((CharacterListServicing.self))!)

            return CharacterListViewModel(inputs: inputs)
        }

        container.register(CharacterListTableViewController.self) { r in
            let vc = CharacterListTableViewController(viewModel: r.resolve(CharacterListViewModel.self)!)

            return vc
        }
    }
}
