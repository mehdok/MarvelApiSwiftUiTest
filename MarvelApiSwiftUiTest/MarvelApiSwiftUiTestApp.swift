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
    
    var body: some Scene {
        WindowGroup {
            MainScreen()
        }.onChange(of: phase) { newPhase in
            switch newPhase {
            
            case .background:
                print("background")
                break
            case .inactive:
                print("inactive")
                break
            case .active:
                print("active")
                break
            @unknown default:
                print("unknown")
                break
            }
        }
    }
}
