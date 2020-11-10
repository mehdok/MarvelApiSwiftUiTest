//
//  System.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/10/20.
//

import Combine

extension Publishers {
    /// system is a glue that connect reducer and feedback by handling event conversion into state
    /// - Parameters:
    ///   - initial: initial state of machine.
    ///   - reduce: reducer function.
    ///   - scheduler: scheduler to devliver the result on it.
    ///   - feedbacks: list of feedbacks.
    /// - Returns: Next state of machine
    static func system<State, Event, Scheduler: Combine.Scheduler>(
        initial: State,
        reduce: @escaping (State, Event) -> State,
        scheduler: Scheduler,
        feedbacks: [Feedback<State, Event>]
    ) -> AnyPublisher<State, Never> {
        // CurrentValueSubject which holds the initial state
        let state = CurrentValueSubject<State, Never>(initial)

        // map feedbacks into events
        let events = feedbacks.map { feedback in feedback.run(state.eraseToAnyPublisher()) }

        return Deferred { // Create the publisher whenever it's necessary
            Publishers.MergeMany(events) // merge all events
                .receive(on: scheduler)
                .scan(initial, reduce)
                .handleEvents(receiveOutput: state.send)
                .receive(on: scheduler)
                .prepend(initial)
                .eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
}
