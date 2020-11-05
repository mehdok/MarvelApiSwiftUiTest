//
//  StoryList.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

public struct StoryList: BaseEntity {
    public init(available: Int?, returned: Int?, collectionURI: String?, items: [StorySummary]?) {
        self.available = available
        self.returned = returned
        self.collectionURI = collectionURI
        self.items = items
    }
    
    /// The number of total available stories in this list. Will always be greater than or equal to the "returned" value.
    public let available: Int?
    /// The number of stories returned in this collection (up to 20).
    public let returned: Int?
    /// The path to the full list of stories in this collection.
    public let collectionURI: String?
    /// The list of returned stories in this collection.
    public let items: [StorySummary]?
}
