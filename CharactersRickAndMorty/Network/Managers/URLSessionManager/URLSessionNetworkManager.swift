//
//  URLSessionNetworkManager.swift
//  CharactersRickAndMorty
//
//  Created by Zaven Madoyan on 16.01.23.
//

import Foundation
import RxSwift

struct URLSessionNetworkManager: Fetching {
    func fetchData(routing: Routing) -> Single<Data> {
        return Single.create { single in
            let session = URLSession.shared
            let dataTask = session.dataTask(with: routing.urlRequest) { (data, response, error) in
                if let error = error {
                    single(.failure(error))
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                      routing.acceptableStatusCodes.contains(httpResponse.statusCode) else {
                    single(.failure(CustomError.NetworkError.unacceptableStatusCode))
                    
                    return
                }
                
                guard let data = data else {
                    single(.failure(CustomError.NetworkError.emptyData))
                    
                    return
                }
                
                single(.success(data))
            }
            
            dataTask.resume()
            
            return Disposables.create {
                dataTask.cancel()
            }
        }
    }
}
