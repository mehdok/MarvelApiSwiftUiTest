//
//  URLSessionProtocol.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/5/20.
//

import Combine
import DomainLayer

protocol URLSessionProtocol {
    var session: URLSession { get }
    /// Returns a publisher that wraps a URL session data task for a given URL request.
    ///
    /// The publisher publishes data when the task completes, or terminates if the task fails with an error.
    /// - Parameter request: The URL request for which to create a data task.
    /// - Returns: A publisher that wraps a data task for the URL request.
    func dataTaskPublisher(for request: URLRequest)
        -> AnyPublisher<Data, APIError>
}

extension URLSessionProtocol {
    func dataTaskPublisher(for request: URLRequest)
        -> AnyPublisher<Data, APIError> {
        session.dataTaskPublisher(for: request)
            .mapError { self.mapError($0) }
            .flatMap { self.validateStatusCode($0) }
            .eraseToAnyPublisher()
    }
    
    private func mapError(_ error: URLError) -> APIError {
        switch error.code {
        // TODO: handle expire token
        default:
            return .unknown(code: error.errorCode,
                            description: error.localizedDescription)
        }
    }

    private func validateStatusCode(_ output: URLSession.DataTaskPublisher
        .Output) -> AnyPublisher<Data, APIError> {
        switch (output.response as? HTTPURLResponse)?.statusCode {
        case .some(HttpStatusCode.ok.rawValue):
            return Result.success(output.data).publisher
                .eraseToAnyPublisher()
        default:
            return Fail(error: APIError.undefined).eraseToAnyPublisher()
        }
    }
}
