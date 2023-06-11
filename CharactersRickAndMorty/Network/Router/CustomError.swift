//
//  CustomError.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation

enum CustomError {
    enum NetworkError: String, Error {
        case missingURL = "URL is nil."
        case unacceptableStatusCode = "Unacceptable Status Code."
        case emptyData = "Empty data."
        case unauthorized = "Unauthorized"
    }
}

extension CustomError {
    enum ParsingError: String, Error {
        case encodingFailed = "Data encoding failed."
        case decodingFailed = "Data decoding failed."
    }
}

extension CustomError {
    enum LoadingError: Error {
        case fileLocateFailed(filename: String)
        case fileLoadFailed(filename: String)

        var message: String {
            switch self {
            case .fileLocateFailed(let filename):
                return "Failed to locate \(filename) in app bundle."
            case .fileLoadFailed(let filename):
                return "Failed to load \(filename) from app bundle."
            }
        }
    }
}
