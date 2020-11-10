//
//  MainScreen.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import Combine
import DataLayer
import SwiftUI
import DomainLayer

struct MainScreen: BaseScreen {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        switch viewModel.state {
        case .idle:
            Log.i("idle")
        case .loading:
                Log.i("loading")
        case .loaded(let characters):
            Log.i("loaded: \(characters.count)")
        case .error(let error):
            Log.i("error: \(error.localizedDescription)")
        }
        
        return Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                self.viewModel.send(event: .onAppear)
            }
    }
}

struct MainScreen_Previews: PreviewProvider {
    @Inject private static var dataModule: DataModuleType

    static var previews: some View {
        BasePreview {
            MainScreen(viewModel: MainViewModel(initialState: .idle,
                                                marvelCharacterUsecase: dataModule.component()))
        }
    }
}
