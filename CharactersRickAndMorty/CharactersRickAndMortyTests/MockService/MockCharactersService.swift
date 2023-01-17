//
//  MockCharactersService.swift
//  CharactersRickAndMortyTests
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation
import RxSwift

@testable import CharactersRickAndMorty

final class MockCharactersService: BaseMockService, CharacterListServicing {
    func fetch(routing: CharacterListParameter) -> Single<CharacterListResponse> {
        fetchMethodCallCount += 1

        return Single.create { single in
            guard !self.shouldThrowError else {
                single(.failure(MockError.failure))

                return Disposables.create()
            }

            let response = CharacterListResponseFactory.createUserResponse()

            single(.success(response))

            return Disposables.create()
        }
    }
}
