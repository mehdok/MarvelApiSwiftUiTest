//
//  MarvelCharacterRepositoryOnline.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

import Combine

public protocol MarvelCharacterRepositoryOnline {
    /// Get list of marvel characters
    /// - Parameters:
    ///   - limit: limit the number of characters per page
    ///   - offset: start offset
    func getCharacters(limit: Int, offset: Int) -> AnyPublisher<Resource<CharacterDataWrapper>, Never>
}
