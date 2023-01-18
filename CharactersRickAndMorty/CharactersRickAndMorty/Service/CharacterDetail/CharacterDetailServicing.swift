//
//  CharacterDetailServicing.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 18.01.23.
//

import Foundation
import RxSwift

protocol CharacterDetailServicing {
    func fetch(routing: CharacterDetailParameter) -> Single<CharacterDetailResponse>
}
