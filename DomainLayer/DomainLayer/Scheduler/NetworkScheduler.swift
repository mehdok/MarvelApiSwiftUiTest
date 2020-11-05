//
//  NetworkScheduler.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

import RxSwift

/// Background scheduler to run network request in rx way
public struct NetworkScheduler {
    public let scheduler: SchedulerType

    init() {
        scheduler =
            SerialDispatchQueueScheduler(qos: .background,
                                         internalSerialQueueName: "com.mehdok.marvel.network")
    }
}
