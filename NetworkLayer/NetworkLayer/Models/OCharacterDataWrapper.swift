//
//  OCharacterDataWrapper.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OCharacterDataWrapper: BaseModel {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let data: OCharacterDataContainer?
    let etag: String?
}

extension OCharacterDataWrapper {
    var entity: CharacterDataWrapper {
        CharacterDataWrapper(code: code,
                             status: status,
                             copyright: copyright,
                             attributionText: attributionText,
                             attributionHTML: attributionHTML,
                             data: data?.entity,
                             etag: etag)
    }
}
