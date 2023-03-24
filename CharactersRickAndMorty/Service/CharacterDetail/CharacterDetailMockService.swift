//
//  CharacterDetailMockService.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 18.01.23.
//

import Foundation
import RxSwift

final class CharacterDetailMockService: Service, CharacterDetailServicing {
    func fetch(routing: CharacterDetailParameter) -> Single<CharacterDetailResponse> {
        return call(routing: routing)
    }
}
