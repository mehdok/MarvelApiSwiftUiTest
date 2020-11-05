//
//  ComicList.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

import UIKit

public struct ComicList: BaseEntity {
    public init(available: Int?, returned: Int?, collectionURI: String?, items: [ComicSummary]?) {
        self.available = available
        self.returned = returned
        self.collectionURI = collectionURI
        self.items = items
    }
    
    /// The number of total available issues in this list. Will always be greater than or equal to the "returned" value.
    public let available: Int?
    /// The number of issues returned in this collection (up to 20).
    public let returned: Int?
    /// The path to the full list of issues in this collection.
    public let collectionURI: String?
    /// The list of returned issues in this collection.
    public let items: [ComicSummary]?
}
