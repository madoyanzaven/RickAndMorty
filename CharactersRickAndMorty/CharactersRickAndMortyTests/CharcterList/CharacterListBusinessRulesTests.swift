//
//  CharacterListBusinessRulesTests.swift
//  CharactersRickAndMortyTests
//
//  Created by Zaven Madoyan on 17.01.23.
//

import XCTest
@testable import CharactersRickAndMorty

final class CharacterListBusinessRulesTests: XCTestCase {
    private struct MockedCharacterListBusinessRules: CharacterListBusinessRules {}
    private let characterListBusinessRulesTests = MockedCharacterListBusinessRules()

    override func tearDown() {
        super.tearDown()

    }

    func test_isPageNotOffset() {
        let actualResult = characterListBusinessRulesTests.isPageNotOffset(1, 10)

        XCTAssertTrue(actualResult)
    }
}
