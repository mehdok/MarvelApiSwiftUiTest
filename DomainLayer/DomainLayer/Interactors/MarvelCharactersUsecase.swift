//
//  MarvelCharactersUsecase.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

import RxSwift

public typealias CharacterUsecaseParam = (Int, Int)

public struct MarvelCharactersUsecase: ObservableUseCase {
    let marvelCharacterRepository: MarvelCharacterRepositoryOnline
    let backgroundScheduler: SchedulerType
    let mainScheduler: SchedulerType
    
    public init(marvelCharacterRepository: MarvelCharacterRepositoryOnline,
                backgroundScheduler: SchedulerType,
                mainScheduler: SchedulerType)
    {
        self.marvelCharacterRepository = marvelCharacterRepository
        self.backgroundScheduler = backgroundScheduler
        self.mainScheduler = mainScheduler
    }
    
    public typealias Output = Resource<CharacterDataWrapper>
    
    public typealias Input = CharacterUsecaseParam
    
    public func execute(_ input: CharacterUsecaseParam) -> Observable<Resource<CharacterDataWrapper>> {
        let (limit, offset) = input
        return marvelCharacterRepository.getCharacters(limit: limit, offset: offset)
            .subscribeOn(backgroundScheduler)
            .observeOn(mainScheduler)
    }
}
