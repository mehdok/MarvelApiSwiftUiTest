//
//  EndPoint.swift
//  NetworkLayer
//
//  Created by Mehdok on 11/5/20.
//

enum EndPoint: String {
    case characters = "characters"
}

extension EndPoint {
    var method: String {
        switch self {
        case .characters:
            return "GET"
        }
    }
}
