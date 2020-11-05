//
//  ApiClient.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/5/20.
//

import DomainLayer
import Combine

struct ApiClient: BaseApiClient {
    private let kUrlEndPoint = "https://gateway.marvel.com:443/v1/public/"

    let session: URLSessionProtocol
    let decoder: JSONDecoder
    let keys: Keys
    
    func call<T: Decodable>(_ endPoint: EndPoint,
                 headers: [String : String]?,
                 queries: [URLQueryItem]?,
                 body: [String : Any]?) -> AnyPublisher<Resource<T>, Never> {
        return send(endPoint, headers: headers, queries: queries, body: body
                    )
            .decode(type: T.self, decoder: decoder)
            .map { Resource.success(response: $0) }
            .mapError {
                APIError.jsonParseError(description: $0.localizedDescription)
            }
            .catch { Just<Resource>(.failure(error: $0)) }
            .eraseToAnyPublisher()
    }
    

}

extension ApiClient {
    private func send(
        _ endPoint: EndPoint,
        headers: [String: String]? = nil,
        queries: [URLQueryItem]? = nil,
        body: [String: Any]? = nil
    ) -> AnyPublisher<Data, APIError> {
        var urlComponenet = URLComponents(string: kUrlEndPoint)!

        // add end point to base url
        urlComponenet
            .queryItems =
            [URLQueryItem(name: "method", value: endPoint.rawValue)]

        var finalBody = body ?? [:]
        let request = urlRequest(&urlComponenet, method: endPoint.method,
                                 headers: headers, queries: queries,
                                 body: &finalBody)

        return session.dataTaskPublisher(for: request)
            .eraseToAnyPublisher()
    }
}

extension ApiClient {
    private func urlRequest(_ component: inout URLComponents, method: String,
                            headers: [String: String]? = nil,
                            queries: [URLQueryItem]? = nil,
                            body: inout [String: Any]) -> URLRequest
    {
        // append client id and secret
        let ts = Date().timeIntervalSince1970

        component.queryItems = [
            URLQueryItem(name: "ts", value: "\(ts)"),
            URLQueryItem(name: "apikey", value: keys.publicKey),
            URLQueryItem(name: "hash", value: "\(ts)\(keys.privateKey)\(keys.publicKey)".md5())
        ]

        // add queries to url
        if let queries = queries {
            queries
                .forEach {
                    component.queryItems?
                        .append(URLQueryItem(name: $0.name, value: $0.value))
                }
        }

        var request = URLRequest(url: component.url!)
        // set http method from endpoint
        request.httpMethod = method

        // add headers
        request.allHTTPHeaderFields = headers

        // add body
        if body.count > 0 {
            do {
                let bodyData = try JSONSerialization
                    .data(withJSONObject: body, options: [])
                request.httpBody = bodyData
            } catch {
                // Log.e(error.localizedDescription)
            }
        }

        return request
    }
}
