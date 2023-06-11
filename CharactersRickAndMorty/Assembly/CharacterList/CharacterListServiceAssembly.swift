//
//  CharacterListServiceAssembly.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import Swinject

final class CharacterListServiceAssembly: Assembly {
    func assemble(container: Container) {
        let isMock = Environment.isMock

        if isMock {
            container.register(CharacterListServicing.self) { _ in CharacterListMockService(dataFetcher: DataFetcherManagerProvider.mock)}
        } else {
            container.register(CharacterListServicing.self) { _ in CharacterListWebService(dataFetcher: DataFetcherManagerProvider.web)}
        }
    }
}
