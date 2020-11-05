//
//  URLSessionImpl.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/5/20.
//

class URLSessionImpl: URLSessionProtocol {
    lazy var session: URLSession = {
        let config = URLSessionConfiguration
            .background(withIdentifier: String(describing: self))
        return URLSession(configuration: config)
    }()
}
