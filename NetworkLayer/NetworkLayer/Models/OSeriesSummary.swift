//
//  OSeriesSummary.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OSeriesSummary: BaseModel {
    let resourceURI: String?
    let name: String?
}

extension OSeriesSummary {
    var entity: SeriesSummary {
        SeriesSummary(resourceURI: resourceURI, name: name)
    }
}
