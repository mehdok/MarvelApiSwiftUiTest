//
//  OEventSummary.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OEventSummary: BaseModel {
    let resourceURI: String?
    let name: String?
}

extension OEventSummary {
    var entity: EventSummary{
        EventSummary(resourceURI: resourceURI, name: name)
    }
}
