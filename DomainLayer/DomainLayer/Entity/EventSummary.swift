//
//  EventSummary.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

public struct EventSummary: BaseEntity {
    public init(resourceURI: String?, name: String?) {
        self.resourceURI = resourceURI
        self.name = name
    }
    
    /// The path to the individual event resource.
    public let resourceURI: String?
    /// The name of the event.
    public let name: String?
}
