//
//  CharacterViewModelTests.swift
//  CharactersRickAndMortyTests
//
//  Created by Zaven Madoyan on 17.01.23.
//

import XCTest
@testable import CharactersRickAndMorty

class CharacterViewModelTests: XCTestCase {
    var viewModel: CharacterListViewModel!
    var service: MockCharactersService!

    override func setUp() {
        super.setUp()

        let inputs = CharacterListInputs(characterList: service)

        service = MockCharactersService()
        viewModel = CharacterListViewModel(inputs: inputs)
    }

    override func tearDown() {
        super.tearDown()

        viewModel = nil
        service = nil
    }

    func test_FetchData() {
        XCTAssertEqual(service.fetchMethodCallCount, 0, "fetchMethodCallCount default value is 0, fetch count is \(service.fetchMethodCallCount)")

        viewModel.loadCharacterList()

        XCTAssertEqual(service.fetchMethodCallCount, 1, "fetchMethodCallCount is  \(service.fetchMethodCallCount), expected value: 1")
    }
}
