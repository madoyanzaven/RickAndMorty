//
//  DataEncoding.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation

protocol DataEncoding {
    func encode(urlRequest: inout URLRequest, parameters: [String: Any])
}
