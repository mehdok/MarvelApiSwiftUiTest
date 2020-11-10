//
//  MockJson.swift
//  MarvelApiSwiftUiTest
//
//  Created by Mehdok on 11/10/20.
//

import UIKit
import DomainLayer

class MockJson: NSObject {
    static var charactersSample: [Character] {
        let jsonData = mockJson("CharactersData")!
        return try! JSONDecoder().decode([Character].self, from: jsonData)
    }

}

extension MockJson {
    private static func mockJson(_ name: String) -> Data? {
        guard let filepath = Bundle.main.url(forResource: name, withExtension: "json") else {
            return nil
        }

        do {
            let contents = try Data(contentsOf: filepath)
            return contents
        } catch {
            return nil
        }
    }
}

