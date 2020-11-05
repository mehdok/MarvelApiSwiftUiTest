//
//  Resource.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

/// - Tag: Resource
public enum Resource<T: Decodable> {
    case success(response: T)
    case failure(error: APIError)
}

