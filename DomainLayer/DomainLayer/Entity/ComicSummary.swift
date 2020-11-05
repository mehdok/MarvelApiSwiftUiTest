//
//  ComicSummary.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//


public struct ComicSummary: BaseEntity {
    public init(resourceURI: String?, name: String?) {
        self.resourceURI = resourceURI
        self.name = name
    }
    
    /// The path to the individual comic resource.
    public let resourceURI: String?
    /// The canonical name of the comic.
    public let name: String?
}
