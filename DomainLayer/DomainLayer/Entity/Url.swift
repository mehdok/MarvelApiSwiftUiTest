//
//  Url.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//


public struct Url: BaseEntity {
    public init(type: String?, url: String?) {
        self.type = type
        self.url = url
    }
    
    // A text identifier for the URL.
    public let type: String?
    // A full URL (including scheme, domain, and path).
    public let url: String?
}
