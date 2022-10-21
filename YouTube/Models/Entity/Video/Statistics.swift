//
//  Statistics.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/13.
//

import Foundation

struct Statistics: Codable {
    var viewCount: String?
    var likeCount: String?
    var dislikeCount: String?
    var favoriteCount: String?
    var commentCount: String?
    
    enum CodingKeys: CodingKey {
        case viewCount,
             likeCount,
             dislikeCount,
             favoriteCount,
             commentCount
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        viewCount = try? rootContainer.decode(String.self, forKey: .viewCount)
        likeCount = try? rootContainer.decode(String.self, forKey: .likeCount)
        dislikeCount = try? rootContainer.decode(String.self, forKey: .dislikeCount)
        favoriteCount = try? rootContainer.decode(String.self, forKey: .favoriteCount)
        commentCount = try? rootContainer.decode(String.self, forKey: .commentCount)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(viewCount, forKey: .viewCount)
        try container.encodeIfPresent(likeCount, forKey: .likeCount)
        try container.encodeIfPresent(dislikeCount, forKey: .dislikeCount)
        try container.encodeIfPresent(favoriteCount, forKey: .favoriteCount)
        try container.encodeIfPresent(commentCount, forKey: .commentCount)
        
    }
}

