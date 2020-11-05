//
//  OCharacter.swift
//  NetworkLayer
//
//  Created by Mehdok on 10/29/20.
//

import DomainLayer

struct OCharacter: BaseModel {
    let id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let resourceURI: String
    let urls: [OUrl]?
    let thumbnail: OImage?
    let comics: OComicList?
    let stories: OStoryList?
    let events: OEventList?
    let series: OSeriesList?
}

extension OCharacter {
    var entity: Character {
        Character(id: id,
                  name: name,
                  description: description,
                  modified: modified,
                  resourceURI: resourceURI,
                  urls: urls?.map { $0.entity },
                  thumbnail: thumbnail?.entity,
                  comics: comics?.entity,
                  stories: stories?.entity,
                  events: events?.entity,
                  series: series?.entity)
    }
}
