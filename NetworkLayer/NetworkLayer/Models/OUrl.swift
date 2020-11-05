//
//  OUrl.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OUrl: BaseModel {
    let type: String?
    let url: String?
}

extension OUrl {
    var entity: Url {
        Url(type: type, url: url)
    }
}
