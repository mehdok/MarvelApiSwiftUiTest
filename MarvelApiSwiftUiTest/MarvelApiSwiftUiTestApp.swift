//
//  MarvelApiSwiftUiTestApp.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import SwiftUI

@main
struct MarvelApiSwiftUiTestApp: App {
    @Environment(\.scenePhase) private var phase
    private let pluggableApp = PluggableApp()
    
    var body: some Scene {
        WindowGroup {
            MainScreen()
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
