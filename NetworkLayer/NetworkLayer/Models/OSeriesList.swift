//
//  OSeriesList.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OSeriesList: BaseModel {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [OSeriesSummary]?
}

extension OSeriesList {
    var entity: SeriesList {
        SeriesList(available: available,
                   returned: returned,
                   collectionURI: collectionURI,
                   items: items?.map { $0.entity })
    }
}
