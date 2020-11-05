//
//  SeriesList.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

public struct SeriesList: BaseEntity {
    public init(available: Int?, returned: Int?, collectionURI: String?, items: [SeriesSummary]?) {
        self.available = available
        self.returned = returned
        self.collectionURI = collectionURI
        self.items = items
    }
    
    /// The number of total available series in this list. Will always be greater than or equal to the "returned" value.
    public let available: Int?
    /// The number of series returned in this collection (up to 20).
    public let returned: Int?
    /// The path to the full list of series in this collection.
    public let collectionURI: String?
    /// The list of returned series in this collection.
    public let items: [SeriesSummary]?
}
