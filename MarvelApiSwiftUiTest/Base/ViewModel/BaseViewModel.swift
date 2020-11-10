//
//  BaseViewModel.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import Combine
import DesignSystem
import DomainLayer
import Swift

public protocol BaseViewModelProtocol: ObservableObject {}

/// State is the single source of truth. It represents a state of your system and is usually a plain Swift type. Your state is immutable. The only way to transition from one State to another is to emit an Event.
public protocol BaseState {}

/// Represents all possible events that can happen in your system which can cause a transition to a new State.
public protocol BaseEvent {}

open class BaseViewModel<State, Event>:
    BaseViewModelProtocol where State: BaseState, Event: BaseEvent
{
    @Published private(set) var state: State
    var bag = Set<AnyCancellable>()
    var input = PassthroughSubject<Event, Never>()

    init(initialState: State) {
        state = initialState
        Publishers.system(initial: state,
                          reduce: reduce,
                          scheduler: RunLoop.main,
                          feedbacks: feedbacks() + [userInput(input: input.eraseToAnyPublisher())])
            .sink { [weak self] state in self?.state = state }
            .store(in: &bag)
    }

    private func userInput(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback(run: { _ in
            input
        })
    }

    /// Specifies how the state changes in response to an event.
    ///
    /// - Parameter state: Current state of machine.
    /// - Parameter event: Incoming event.
    ///
    /// - Returns: Next state of machine.
    func reduce(_ state: State, _ event: Event) -> State {
        preconditionFailure("This method must be overridden \(state) - \(event)")
    }

    /// Feedback is the extension point between the code that generates events and the code that reduces
    ///  events into a new state. All your side effects will sit in here. Feedback allows us to separate side
    ///  effects from the pure structure of the state machine itself
    ///  Feedback produces a stream of events in response to state changes. It allows us to perform side
    ///  effects, like IO, between the moments when an event has been sent, and when it reaches the reduce function
    ///
    /// - Returns: List of feedbacks
    func feedbacks() -> [Feedback<State, Event>] {
        preconditionFailure("This method must be overridden")
    }

    /// Putting an event into machine.
    ///
    /// - Parameter event: The next event.
    func send(event: Event) {
        input.send(event)
    }

    deinit {
        Log.i("deinit: \(String(describing: self))")

        bag.forEach {
            $0.cancel()
        }
        
        bag.removeAll()
    }
}
