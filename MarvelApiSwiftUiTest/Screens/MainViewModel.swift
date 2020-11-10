//
//  MainViewModel.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import Combine

enum MainState: BaseState { case idle }

enum MainEvent: BaseEvent {}

class MainViewModel: BaseViewModel<MainState, MainEvent> {
    override func feedbacks() -> [Feedback<MainState, MainEvent>] {
        []
    }
    
    override func reduce(_ state: MainState, _ event: MainEvent) -> MainState {
        
    }
}
