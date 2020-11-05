//
//  OStorySummary.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OStorySummary: BaseModel {
    let resourceURI: String?
    let name: String?
    let type: String?
}

extension OStorySummary {
    var entity: StorySummary {
        StorySummary(resourceURI: resourceURI, name: name, type: type)
    }
}
