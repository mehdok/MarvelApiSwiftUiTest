//
//  Image.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

public struct Image: BaseEntity {
    public init(path: String?, ext: String?) {
        self.path = path
        self.ext = ext
    }

    /// The directory path of to the image.
    public let path: String?
    /// The file extension for the image.
    public let ext: String?

    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}
