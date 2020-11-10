//
//  MarvelApiSwiftUiTestApp.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import SwiftUI
import DomainLayer
import DataLayer

@main
struct MarvelApiSwiftUiTestApp: App {
    @Environment(\.scenePhase) private var phase
    private let pluggableApp = PluggableApp()
    @Inject private var dataModule: DataModuleType
    
    var body: some Scene {
        WindowGroup {
            MainScreen(viewModel: MainViewModel(initialState: .idle,
                                                marvelCharacterUsecase: dataModule.component()))
        }.onChange(of: phase) { newPhase in
            switch newPhase {
            
            case .background:
                pluggableApp.background()
                break
            case .inactive:
                pluggableApp.inactive()
                break
            case .active:
                pluggableApp.active()
                break
            @unknown default:
                Log.e("unknown")
                break
            }
        }
    }
}
