//
//  Character.swift
//  DomainLayer
//
//  Created by Mehdok on 10/29/20.
//

public struct Character: BaseEntity {
    public init(id: Int?, name: String?, description: String?, modified: String?, resourceURI: String, urls: [Url]?, thumbnail: Image?, comics: ComicList?, stories: StoryList?, events: EventList?, series: SeriesList?) {
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
        self.resourceURI = resourceURI
        self.urls = urls
        self.thumbnail = thumbnail
        self.comics = comics
        self.stories = stories
        self.events = events
        self.series = series
    }

    /// The unique ID of the character resource.
    public let id: Int?
    /// The name of the character.
    public let name: String?
    /// A short bio or description of the character.
    public let description: String?
    /// The date the resource was most recently modified.
    public let modified: String?
    /// The canonical URL identifier for this resource.
    public let resourceURI: String
    /// A set of public web site URLs for the resource.
    public let urls: [Url]?
    /// The representative image for this character.
    public let thumbnail: Image?
    /// A resource list containing comics which feature this character.
    public let comics: ComicList?
    /// A resource list of stories in which this character appears.
    public let stories: StoryList?
    /// A resource list of events in which this character appears.
    public let events: EventList?
    /// A resource list of series in which this character appears.
    public let series: SeriesList?
}

extension Character: Equatable {
    public static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
}
