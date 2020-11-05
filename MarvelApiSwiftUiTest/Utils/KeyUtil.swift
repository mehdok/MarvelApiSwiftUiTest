//
//  KeyUtil.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/5/20.
//

import DomainLayer

class KeyUtil: NSObject {
    static var apiKeys: Keys {
        guard let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
            let keysData = FileManager.default.contents(atPath: path),
            let keys = try? PropertyListDecoder().decode(Keys.self, from: keysData)
        else {
            preconditionFailure("Can not retrieve api keys")
        }

        return keys
    }
}
