//
//  OStoryList.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OStoryList: BaseModel {
    let available: Int?
    let returned: Int?
    let collectionURI: String?
    let items: [OStorySummary]?
}

extension OStoryList {
    var entity: StoryList {
        StoryList(available: available,
                  returned: returned,
                  collectionURI: collectionURI,
                  items: items?.map { $0.entity })
    }
}
