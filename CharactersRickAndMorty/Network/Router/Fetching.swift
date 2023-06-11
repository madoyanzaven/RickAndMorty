//
//  Fetching.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import RxSwift

protocol Fetching {
    func fetchData(routing: Routing) -> Single<Data>
}
