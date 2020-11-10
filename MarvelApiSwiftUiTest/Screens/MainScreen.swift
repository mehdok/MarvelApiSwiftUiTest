//
//  MainScreen.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import Combine
import SwiftUI

struct MainScreen: BaseScreen {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        BasePreview {
            MainScreen(viewModel: MainViewModel(initialState: .idle))
        }
    }
}
