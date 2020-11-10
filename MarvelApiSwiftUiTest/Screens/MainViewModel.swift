//
//  MainViewModel.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import Combine
import DomainLayer

enum MainState: BaseState {
    case idle
    case loading
    case loaded([Character])
    case error(APIError)
}

enum MainEvent: BaseEvent {
    case onAppear
    case onCharacterSelect(Character)
    case onCharactersLoaded([Character])
    case onFailedToLoadCharacters(APIError)
}

class MainViewModel: BaseViewModel<MainState, MainEvent> {
    let marvelCharacterUsecase: MarvelCharactersUsecase

    init(initialState: MainState, marvelCharacterUsecase: MarvelCharactersUsecase) {
        self.marvelCharacterUsecase = marvelCharacterUsecase
        super.init(initialState: initialState)
    }

    override func feedbacks() -> [Feedback<MainState, MainEvent>] {
        [whenLoading()]
    }

    override func reduce(_ state: MainState, _ event: MainEvent) -> MainState {
        switch state {
        case .idle:
            return idleNextStateFor(event)
        case .loading:
            return loadingNextStateFor(event)
        case .loaded:
            return state
        case .error:
            return state
        }
    }
}

extension MainViewModel {
    private func idleNextStateFor(_ event: MainEvent) -> MainState {
        switch event {
        case .onAppear:
            return .loading
        default: return state
        }
    }

    private func loadingNextStateFor(_ event: MainEvent) -> MainState {
        switch event {
        case .onFailedToLoadCharacters(let error):
            return .error(error)
        case .onCharactersLoaded(let characters):
            return .loaded(characters)
        default: return state
        }
    }
}

extension MainViewModel {
    func whenLoading() -> Feedback<MainState, MainEvent> {
        Feedback { [unowned self] (state: MainState) -> AnyPublisher<MainEvent, Never> in
            guard case .loading = state else { return Empty().eraseToAnyPublisher() }

            return self.marvelCharacterUsecase
                .execute(CharacterUsecaseParam(limit: 20, offset: 0))
                .map { resource in
                    switch resource {
                    case .success(response: let response):
                        return .onCharactersLoaded(response.data?.results ?? [])
                    case .failure(error: let error):
                        return .onFailedToLoadCharacters(error)
                    }
                }
                .eraseToAnyPublisher()
        }
    }
}
