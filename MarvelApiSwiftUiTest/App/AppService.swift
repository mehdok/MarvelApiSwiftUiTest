//
//  AppService.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import UIKit

protocol AppService {
    func initialize()
    
    func background()
    
    func inactive()
    
    func active()
}

extension AppService {
    func initialize() {}
    
    func background() {}
    
    func inactive() {}
    
    func active() {}
}
