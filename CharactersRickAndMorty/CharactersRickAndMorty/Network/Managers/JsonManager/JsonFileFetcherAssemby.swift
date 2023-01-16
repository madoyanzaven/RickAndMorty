//
//  JsonFileFetcherAssemby.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import Swinject

struct JsonFileFetcherAssemby: Assembly {
    func assemble(container: Container) {
        container.register(Fetching.self) { _ in JsonFileFetcher() }
    }
}
