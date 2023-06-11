//
//  DataFetching.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import RxSwift

protocol DataFetching {
    init(dataFetcher: Fetching, parser: Parsing)
    func fetch<T: Decodable>(routing: Routing) -> Single<T>
}
