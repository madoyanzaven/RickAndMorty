//
//  URLEncoder.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation

struct URLEncoder: DataEncoding {
    func encode(urlRequest: inout URLRequest, parameters: [String: Any]) {
        guard let url = urlRequest.url else { return }

        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            for (key, value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")

                urlComponents.queryItems?.append(queryItem)
            }

            urlRequest.url = urlComponents.url
        }
    }
}
