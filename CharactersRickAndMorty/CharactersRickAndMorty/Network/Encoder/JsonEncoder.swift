//
//  JsonEncoder.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation

struct JsonEncoder: DataEncoding {
    func encode(urlRequest: inout URLRequest, parameters: [String: Any]) {
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)

        urlRequest.httpBody = jsonData
    }
}
