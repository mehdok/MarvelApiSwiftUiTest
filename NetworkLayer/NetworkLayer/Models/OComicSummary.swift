//
//  OComicSummary.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OComicSummary: BaseModel {
    let resourceURI: String?
    let name: String?
}

extension OComicSummary {
    var entity: ComicSummary {
        ComicSummary(resourceURI: resourceURI, name: name)
    }
}
