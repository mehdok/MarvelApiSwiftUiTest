//
//  NetworkModule.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/5/20.
//

import DomainLayer

public protocol NetworkModuleType {
    func component() -> MarvelCharacterRepositoryOnline
}

public struct NetworkModule: NetworkModuleType {
    let keys: Keys

    public init(keys: Keys) {
        self.keys = keys
    }

    public func component() -> MarvelCharacterRepositoryOnline {
        MarvelCharacterRepositoryOnlineImpl(client: component())
    }
}

extension NetworkModule {
    fileprivate func component() -> URLSession {
        let configuration = URLSessionConfiguration
            .background(withIdentifier: String(describing: URLSessionImpl.self))
        configuration.timeoutIntervalForRequest = 15 // seconds
        configuration.timeoutIntervalForResource = 15
        return URLSession(configuration: configuration)
    }

    fileprivate func component() -> JSONDecoder {
        JSONDecoder()
    }

    fileprivate func component() -> URLSessionProtocol {
        URLSessionImpl(session: component())
    }

    fileprivate func component() -> BaseApiClient {
        ApiClient(session: component(), decoder: component(), keys: keys)
    }
}
