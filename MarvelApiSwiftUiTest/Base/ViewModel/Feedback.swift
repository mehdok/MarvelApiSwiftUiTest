//
//  Feedback.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/10/20.
//

import Combine

/// While State represents where the system is at a given time, Event represents a state change,
/// and a Reducer is the pure function that enacts the event causing the state to change, there is not as of yet
/// any type to decide which event should take place given a particular current state. That's the job of the Feedback.
/// It's essentially a "processing engine", listening to changes in the current State and emitting the
/// corresponding next events to take place. Feedbacks don't directly mutate states. Instead, they only emit
/// events which then cause states to change in reducers.
///
/// To some extent it's like reactive Middleware in Redux having a signature of
/// (AnyPublisher<State, Never>) -> AnyPublisher<Event, Never> allows us to observe State
/// changes and perform some side effects based on its changes e.g if a system is in loading state we can
/// start fetching data from network.
struct Feedback<State, Event> {
    let run: (AnyPublisher<State, Never>) -> AnyPublisher<Event, Never>
}

extension Feedback {
    init<Effect: Publisher>(effects: @escaping (State) -> Effect) where Effect.Output == Event, Effect.Failure == Never {
        run = { state -> AnyPublisher<Event, Never> in
            state
                .map { effects($0) }
                .switchToLatest()
                .eraseToAnyPublisher()
        }
    }
}
