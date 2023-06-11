//
//  CharacterListMockService.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import RxSwift

final class CharacterListMockService: Service, CharacterListServicing {
    func fetch(routing: CharacterListParameter) -> Single<CharacterListResponse> {
        return call(routing: routing)
    }
}
