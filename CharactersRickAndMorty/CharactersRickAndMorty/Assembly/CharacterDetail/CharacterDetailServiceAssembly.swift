//
//  CharacterDetailServiceAssembly.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 18.01.23.
//

import Foundation
import Swinject

final class CharacterDetailServiceAssembly: Assembly {
    func assemble(container: Container) {
        let isMock = Environment.isMock

        if isMock {
            container.register(CharacterDetailServicing.self) { _ in CharacterDetailMockService(dataFetcher: DataFetcherManagerProvider.mock)}
        } else {
            container.register(CharacterDetailServicing.self) { _ in CharacterDetailWebService(dataFetcher: DataFetcherManagerProvider.web)}
        }
    }
}
