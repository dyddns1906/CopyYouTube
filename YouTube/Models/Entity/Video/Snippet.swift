//
//  Snippet.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/12.
//

import Foundation

struct Snippet: Codable {
    var publishedAt: String?
    var channelId: String?
    var title: String?
    var description: String?
    var thumbnails: [ThumbnailsType : ThumbnailModels]?
    var channelTitle: String?
    var tags: [String]?
    var categoryId: String?
    var liveBroadcastContent: String?
    var localized: [BaseLocalizedType:String]?
    var defaultAudioLanguage: String?
    
    
    enum CodingKeys: CodingKey {
        case publishedAt,
             channelId,
             title,
             description,
             thumbnails,
             channelTitle,
             tags,
             categoryId,
             liveBroadcastContent,
             localized,
             defaultAudioLanguage
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        publishedAt = try? rootContainer.decode(String.self, forKey: .publishedAt)
        channelId = try? rootContainer.decode(String.self, forKey: .channelId)
        title = try? rootContainer.decode(String.self, forKey: .title)
        description = try? rootContainer.decode(String.self, forKey: .description)
        thumbnails = try? rootContainer.decode([ThumbnailsType : ThumbnailModels].self, forKey: .thumbnails)
        channelTitle = try? rootContainer.decode(String.self, forKey: .channelTitle)
        tags = try? rootContainer.decode([String].self, forKey: .tags)
        categoryId = try? rootContainer.decode(String.self, forKey: .categoryId)
        liveBroadcastContent = try? rootContainer.decode(String.self, forKey: .liveBroadcastContent)
        localized = try? rootContainer.decode([BaseLocalizedType:String].self, forKey: .localized)
        defaultAudioLanguage = try? rootContainer.decode(String.self, forKey: .defaultAudioLanguage)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(publishedAt, forKey: .publishedAt)
        try container.encodeIfPresent(channelId, forKey: .channelId)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(thumbnails, forKey: .thumbnails)
        try container.encodeIfPresent(channelTitle, forKey: .channelTitle)
        try container.encodeIfPresent(tags, forKey: .tags)
        try container.encodeIfPresent(categoryId, forKey: .categoryId)
        try container.encodeIfPresent(liveBroadcastContent, forKey: .liveBroadcastContent)
        try container.encodeIfPresent(localized, forKey: .localized)
        try container.encodeIfPresent(defaultAudioLanguage, forKey: .defaultAudioLanguage)
        
    }
}
