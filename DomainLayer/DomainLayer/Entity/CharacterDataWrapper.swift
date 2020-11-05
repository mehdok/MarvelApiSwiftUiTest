//
//  CharacterDataWrapper.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

public struct CharacterDataWrapper: BaseEntity {
    public init(code: Int?, status: String?, copyright: String?, attributionText: String?, attributionHTML: String?, data: CharacterDataContainer?, etag: String?) {
        self.code = code
        self.status = status
        self.copyright = copyright
        self.attributionText = attributionText
        self.attributionHTML = attributionHTML
        self.data = data
        self.etag = etag
    }

    /// The HTTP status code of the returned result.
    public let code: Int?
    /// A string description of the call status.
    public let status: String?
    /// The copyright notice for the returned result.
    public let copyright: String?
    /// The attribution notice for this result. Please display either this notice or the let contents: of the attributionHTML field on all screens which contain data from the Marvel Comics API.
    public let attributionText: String?
    /// An HTML representation of the attribution notice for this result. Please display let either: this notice or the contents of the attributionText field on all screens which contain data from the Marvel let Comics: API.
    public let attributionHTML: String?
    /// The results returned by the call.
    public let data: CharacterDataContainer?
    /// A digest value of the content returned by the call.
    public let etag: String?
}
