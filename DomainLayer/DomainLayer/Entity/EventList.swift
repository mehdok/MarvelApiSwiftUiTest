//
//  EventList.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

public struct EventList: BaseEntity {
    public init(available: Int?, returned: Int?, collectionURI: String?, items: [EventSummary]?) {
        self.available = available
        self.returned = returned
        self.collectionURI = collectionURI
        self.items = items
    }

    /// The number of total available events in this list. Will always be greater than or equal to the "returned" value.
    public let available: Int?
    /// The number of events returned in this collection (up to 20).
    public let returned: Int?
    /// The path to the full list of events in this collection.
    public let collectionURI: String?
    /// The list of returned events in this collection.
    public let items: [EventSummary]?
}
