//
//  MarvelCharactersUsecase.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

import Combine

public typealias CharacterUsecaseParam = (limit: Int, offset: Int)

public struct MarvelCharactersUsecase: ObservableUseCase {
    let marvelCharacterRepository: MarvelCharacterRepositoryOnline

    public init(marvelCharacterRepository: MarvelCharacterRepositoryOnline) {
        self.marvelCharacterRepository = marvelCharacterRepository
    }

    public typealias Output = Resource<CharacterDataWrapper>

    public typealias Input = CharacterUsecaseParam

    public func execute(_ input: CharacterUsecaseParam) -> AnyPublisher<Resource<CharacterDataWrapper>, Never> {
        return marvelCharacterRepository
            .getCharacters(limit: input.limit, offset: input.offset)
    }
}
