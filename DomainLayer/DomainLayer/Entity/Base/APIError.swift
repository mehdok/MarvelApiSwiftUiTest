//
//  APIError.swift
//  DomainLayer
//
//  Created by Mehdok on 11/5/20.
//

public enum APIError: Error, LocalizedError {
    case expiredToken
    case unknown(code: Int, description: String)
    case undefined
    case noMockJson
    case undefinedEndpoint
    case jsonParseError(description: String)
    case sessionFailed(description: String)

    public var errorDescription: String? {
        switch self {
        case .expiredToken:
            return "Token expired"
        case .unknown(code: _, description: let description):
            return description
        case .undefined:
            return "Undefined error"
        case .noMockJson:
            return "There is no mock json for this api"
        case .undefinedEndpoint:
            return "The endpoint is not defined"
        case let .jsonParseError(description: description):
            return description
        case let .sessionFailed(description: description):
            return description
        }
    }
}
