//
//  JsonDecoderParserAssembly.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import Swinject

struct JsonDecoderParserAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Parsing.self) { _ in JsonDecoderParser() }
    }
}
