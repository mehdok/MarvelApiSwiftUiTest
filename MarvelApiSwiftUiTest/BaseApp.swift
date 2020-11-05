//
//  BaseApp.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import SwiftUI

struct SystemStatus: ViewModifier {
    @Environment(\.scenePhase) private var phase

    func body(content: Content) -> some View {
        content
            .onChange(of: phase) { newPhase in
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
