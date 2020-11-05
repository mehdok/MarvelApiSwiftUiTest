//
//  DependenciesAppService.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import DataLayer
import DomainLayer
import NetworkLayer

class DependenciesAppService: AppService {
    private let dependencies = Dependencies {
        Module { DomainModule() as DomainModuleType }
        Module { NetworkModule(keys: KeyUtil.apiKeys) as NetworkModuleType }
        Module { DataModule() as DataModuleType }
    }
    
    func initialize() {
        dependencies.build()
        Log.i("build dependencies")
    }
}
