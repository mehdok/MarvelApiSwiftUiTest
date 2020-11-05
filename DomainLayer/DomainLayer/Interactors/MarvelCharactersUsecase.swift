//
//  MarvelCharactersUsecase.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

import Combine

public typealias CharacterUsecaseParam = (Int, Int)

public struct MarvelCharactersUsecase: ObservableUseCase {
    let marvelCharacterRepository: MarvelCharacterRepositoryOnline

    public init(marvelCharacterRepository: MarvelCharacterRepositoryOnline) {
        self.marvelCharacterRepository = marvelCharacterRepository
    }

    public typealias Output = Resource<CharacterDataWrapper>

    public typealias Input = CharacterUsecaseParam

    public func execute(_ input: CharacterUsecaseParam) -> AnyPublisher<Resource<CharacterDataWrapper>, Never> {
        let (limit, offset) = input
        return marvelCharacterRepository
            .getCharacters(limit: limit, offset: offset)
    }
}
