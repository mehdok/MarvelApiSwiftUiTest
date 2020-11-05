//
//  PluggableApp.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import SwiftUI

class PluggableApp: NSObject {
    /// Lazy implementation of application services list
    lazy var lazyServices: [AppService] = services()

    /// List of application services for binding to `App` events
    func services() -> [AppService] {
        return [DependenciesAppService()]
    }

    override init() {
        super.init()
        
        lazyServices.forEach {
            $0.initialize()
        }
    }
}

extension PluggableApp {
    func background() {
        lazyServices.forEach {
            $0.background()
        }
    }

    func inactive() {
        lazyServices.forEach {
            $0.inactive()
        }
    }

    func active() {
        lazyServices.forEach {
            $0.active()
        }
    }
}
