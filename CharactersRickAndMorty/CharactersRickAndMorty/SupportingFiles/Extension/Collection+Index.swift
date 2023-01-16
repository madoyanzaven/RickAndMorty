//
//  Collection+Index.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation

extension Collection {
    subscript (safe index: Self.Index) -> Element? {
        guard indices.contains(index) else { return nil }

        return self[index]
    }
}
