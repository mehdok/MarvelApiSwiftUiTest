//
//  CharacterDataContainer.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//


public struct CharacterDataContainer: BaseEntity {
    public init(offset: Int?, limit: Int?, total: Int?, count: Int?, results: [Character]?) {
        self.offset = offset
        self.limit = limit
        self.total = total
        self.count = count
        self.results = results
    }
    
    /// The requested offset (number of skipped results) of the call.
    public let offset: Int?
    /// The requested result limit.
    public let limit: Int?
    /// The total number of resources available given the current filter set.
    public let total: Int?
    /// The total number of results returned by this call.
    public let count: Int?
    /// The list of characters returned by the call.
    public let results: [Character]?
}
