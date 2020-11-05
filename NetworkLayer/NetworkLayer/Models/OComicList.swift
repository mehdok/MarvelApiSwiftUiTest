//
//  OComicList.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OComicList: BaseModel {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [OComicSummary]?
}

extension OComicList {
    var entity: ComicList {
        ComicList(available: available,
                  returned: returned,
                  collectionURI: collectionURI,
                  items: items?.map { $0.entity })
    }
}
