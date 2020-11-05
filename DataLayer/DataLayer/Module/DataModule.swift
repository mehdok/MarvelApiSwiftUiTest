//
//  DataModule.swift
//  DataLayer
//
//  Created by Mehdok on 11/5/20.
//

import DomainLayer
import NetworkLayer

public protocol DataModuleType {
    func component() -> MarvelCharactersUsecase
}

public struct DataModule: DataModuleType {
    @Inject private var networkModule: NetworkModuleType
    @Inject private var domainModule: DomainModuleType

    public init() {}

    public func component() -> MarvelCharactersUsecase {

        return MarvelCharactersUsecase(
            marvelCharacterRepository: networkModule.component())
    }
}
