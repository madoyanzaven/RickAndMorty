//
//  BaseMockService.swift
//  CharactersRickAndMortyTests
//
//  Created by Zaven Madoyan on 17.01.23.
//

import Foundation

class BaseMockService {
    var fetchMethodCallCount = 0
    var shouldThrowError = false
}

enum MockError: Error {
    case failure
}
