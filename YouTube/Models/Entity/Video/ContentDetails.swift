//
//  ContentDetails.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct ContentDetails: Codable {
    var duration: String?
    var dimension: String?
    var definition: String?
    var caption: Snippet?
    var licensedContent: String?
    var regionRestriction: [RegionRestrictionType:String]?
    var contentRating: [ContentRatingType: String]?
    
    private enum CodingKeys: String, CodingKey {
        case duration,
             dimension,
             definition,
             caption,
             licensedContent,
             regionRestriction,
             contentRating
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        duration = try? rootContainer.decode(String.self, forKey: .duration)
        dimension = try? rootContainer.decode(String.self, forKey: .dimension)
        definition = try? rootContainer.decode(String.self, forKey: .definition)
        caption = try? rootContainer.decode(Snippet.self, forKey: .caption)
        licensedContent = try? rootContainer.decode(String.self, forKey: .licensedContent)
        regionRestriction = try? rootContainer.decode([RegionRestrictionType:String].self, forKey: .regionRestriction)
        contentRating = try? rootContainer.decode([ContentRatingType: String].self, forKey: .contentRating)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(duration, forKey: .duration)
        try container.encodeIfPresent(dimension, forKey: .dimension)
        try container.encodeIfPresent(definition, forKey: .definition)
        try container.encodeIfPresent(caption, forKey: .caption)
        try container.encodeIfPresent(licensedContent, forKey: .licensedContent)
        try container.encodeIfPresent(regionRestriction, forKey: .regionRestriction)
        try container.encodeIfPresent(contentRating, forKey: .contentRating)
        
    }
}
