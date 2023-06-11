//
//  JsonFileFetcher.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import RxSwift

struct JsonFileFetcher: Fetching {
    func fetchData(routing: Routing) -> Single<Data> {
        return Single.create { single in
            do {
                let data = try Bundle.main.loadDataFromJsonFile(fileName: routing.api.jsonFile)

                single(.success(data))
            } catch {
                single(.failure(error))
            }

            return Disposables.create()
        }
    }
}
