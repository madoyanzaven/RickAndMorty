//
//  CharacterListServicing.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import RxSwift

protocol CharacterListServicing {
    func fetch(routing: CharacterListParameter) -> Single<CharacterListResponse>
}
