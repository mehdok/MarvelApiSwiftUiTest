//
//  MainScreen.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import Combine
import DataLayer
import DomainLayer
import SwiftUI
import DesignSystem

struct MainScreen: BaseScreen {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        content
            .onAppear {
                self.viewModel.send(event: .onAppear)
            }
    }

    private var content: some View {
        switch viewModel.state {
        case .idle:
            return Color.clear.eraseToAnyView()
        case .loading:
            return Spinner(isAnimating: true, style: .large).eraseToAnyView()
        case .loaded(let characters):
            return list(of: characters).eraseToAnyView()
        case .error(let error):
            return Text(error.localizedDescription).eraseToAnyView()
        }
    }
    
    private func list(of characters: [Character]) -> some View {
        List(characters, id: \.id) { character in
            CharacterView(character: character)
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
