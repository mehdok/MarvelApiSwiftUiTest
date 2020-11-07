//
//  ApiClient.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/5/20.
//

import Combine
import DomainLayer

struct ApiClient: BaseApiClient {
    private let kUrlEndPoint = "https://gateway.marvel.com:443/v1/public/"

    let session: URLSessionProtocol
    let decoder: JSONDecoder
    let keys: Keys

    func call<T: Decodable>(_ endPoint: EndPoint,
                            headers: [String: String]?,
                            queries: [URLQueryItem]?,
                            body: [String: Any]?) -> AnyPublisher<Resource<T>, Never>
    {
        return send(endPoint, headers: headers, queries: queries, body: body)
            .decode(type: T.self, decoder: decoder)
            .map { Resource.success(response: $0) }
            .mapError {
                // TODO handle other errors
                APIError.jsonParseError(description: $0.localizedDescription)
            }
            .catch { Just<Resource>(.failure(error: $0)) }
            .eraseToAnyPublisher()
    }
}

extension ApiClient {
    private func send(_ endPoint: EndPoint,
                      headers: [String: String]? = nil,
                      queries: [URLQueryItem]? = nil,
                      body: [String: Any]? = nil) -> AnyPublisher<Data, APIError>
    {
        var urlComponenet = URLComponents(string: "\(kUrlEndPoint)\(endPoint.rawValue)")!

        let request = urlRequest(&urlComponenet, method: endPoint.method,
                                 headers: headers, queries: queries,
                                 body: body,
                                 keys: keys)

        return session.dataTaskPublisher(for: request).eraseToAnyPublisher()
    }
}

extension ApiClient {
    private func urlRequest(_ component: inout URLComponents, method: String,
                            headers: [String: String]? = nil,
                            queries: [URLQueryItem]? = nil,
                            body: [String: Any]?,
                            keys: Keys) -> URLRequest
    {
        // append client id and secret
        component.queryItems = authenticationQueries(keys)

        // add queries to url
        if let queryItems = queryListFromMap(queries) {
            component.queryItems?.append(contentsOf: queryItems)
        }

        var request = URLRequest(url: component.url!)
        // set http method from endpoint
        request.httpMethod = method

        // add headers
        request.allHTTPHeaderFields = headers

        // add body
        if let jsonBodyData = bodyData(body) {
            request.httpBody = jsonBodyData
        }

        return request
    }

    private func authenticationQueries(_ keys: Keys) -> [URLQueryItem] {
        let ts = Date().timeIntervalSince1970

        return [
            URLQueryItem(name: "ts", value: "\(ts)"),
            URLQueryItem(name: "apikey", value: keys.publicKey),
            URLQueryItem(name: "hash", value: "\(ts)\(keys.privateKey)\(keys.publicKey)".md5())
        ]
    }

    private func queryListFromMap(_ queries: [URLQueryItem]?) -> [URLQueryItem]? {
        var queryItems: [URLQueryItem]?

        if let queries = queries {
            queryItems = [URLQueryItem]()
            queries.forEach {
                queryItems!.append(URLQueryItem(name: $0.name, value: $0.value))
            }
        }

        return queryItems
    }

    private func bodyData(_ body: [String: Any]?) -> Data? {
        var bodyData: Data?
        
        if let body = body, body.count > 0 {
            do {
                bodyData = try JSONSerialization.data(withJSONObject: body, options: [])
            } catch {
                //nop
            }
        }

        return bodyData
    }
}
