//
//  OImage.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OImage: BaseModel {
    let path: String?
    let ext: String?

    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}

extension OImage {
    var entity: Image {
        Image(path: path, ext: ext)
    }
}
