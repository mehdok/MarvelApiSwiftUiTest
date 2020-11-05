//
//  SeriesSummary.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

import UIKit

public struct SeriesSummary: BaseEntity {
    public init(resourceURI: String?, name: String?) {
        self.resourceURI = resourceURI
        self.name = name
    }

    /// The path to the individual series resource.
    public let resourceURI: String?
    /// The canonical name of the series.
    public let name: String?
}
