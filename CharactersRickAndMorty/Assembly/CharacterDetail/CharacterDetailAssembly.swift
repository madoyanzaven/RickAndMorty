//
//  CharacterDetailAssembly.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 18.01.23.
//

import Foundation
import Swinject

final class CharacterDetailAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CharacterDetailViewModel.self) { r in
            let inputs = CharacterDetailInputs(characterDetail: r.resolve((CharacterDetailServicing.self))!)

            return CharacterDetailViewModel(inputs: inputs)
        }

        container.register(CharacterDetailTableViewController.self) { r in
            let vc = CharacterDetailTableViewController(viewModel: r.resolve(CharacterDetailViewModel.self)!)

            return vc
        }
    }
}
