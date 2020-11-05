//
//  Resource.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

/// Representing Success or Error value which will be returned from data-layer to ui-layer.
///
/// The goal is to force Repositories  to pass an instance of [Resource]
/// which contains [Success] or [Error] (imagine this as an Either type).
public struct Resource<T: Codable>: Equatable {
    public let data: T?
    public let status: Status
    public let error: MarvelError?

    public static func success(data: T) -> Resource {
        Resource(data: data, status: .success, error: nil)
    }

    public static func error(error: MarvelError) -> Resource {
        Resource(data: nil, status: .failure, error: error)
    }

    public static func == (lhs: Resource<T>, rhs: Resource<T>) -> Bool {
        lhs.status == rhs.status
    }
}

public enum Status {
    case success
    case failure
}
