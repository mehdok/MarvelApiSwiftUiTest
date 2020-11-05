//
//  OEventList.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OEventList: BaseModel {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [OEventSummary]?
}

extension OEventList {
    var entity: EventList {
        EventList(available: available,
                  returned: returned,
                  collectionURI: collectionURI,
                  items: items?.map { $0.entity })
    }
}
