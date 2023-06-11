//
//  DataFetcherManagerProvider.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import Swinject

enum DataFetcherManagerProvider {
    static func createDataFetcherManager(with assemblies: [Assembly]) -> DataFetching {
        let resolver = Assembler(assemblies).resolver

        return resolver.resolve(DataFetching.self)!
    }

    static var web: DataFetching {
        return createDataFetcherManager(
            with: [URLSessionNetworkManagerAssembly(),
                   JsonDecoderParserAssembly(),
                   DataFetcherManagerAssembly()])
    }

    static var mock: DataFetching {
        return createDataFetcherManager(
            with: [JsonFileFetcherAssemby(),
                   JsonDecoderParserAssembly(),
                   DataFetcherManagerAssembly()])
    }
}
