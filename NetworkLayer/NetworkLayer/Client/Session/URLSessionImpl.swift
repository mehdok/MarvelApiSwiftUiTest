//
//  URLSessionImpl.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/5/20.
//

class URLSessionImpl: URLSessionProtocol {
    var session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
}
