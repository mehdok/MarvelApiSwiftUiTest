//
//  StorySummary.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//


public struct StorySummary: BaseEntity {
    public init(resourceURI: String?, name: String?, type: String?) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
    
    /// The path to the individual story resource.
    public let resourceURI: String?
    /// The canonical name of the story.
    public let name: String?
    /// The type of the story (interior or cover).
    public let type: String?
}
