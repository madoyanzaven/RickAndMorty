//
//  Parsing.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import RxSwift

protocol Parsing {
    func parse<T: Decodable>(data: Data) -> Single<T>
}
