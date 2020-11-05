//
//  OCharacterDataContainer.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OCharacterDataContainer: BaseModel {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [OCharacter]?
}

extension OCharacterDataContainer {
    var entity: CharacterDataContainer {
        CharacterDataContainer(offset: offset,
                               limit: limit,
                               total: total,
                               count: count,
                               results: results?.map { $0.entity })
    }
}
