//
//  DomainModule.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

public protocol DomainModuleType {
    func component() -> NetworkScheduler
}

public struct DomainModule: DomainModuleType {
    public init() {}

    public func component() -> NetworkScheduler {
        NetworkScheduler()
    }
}
