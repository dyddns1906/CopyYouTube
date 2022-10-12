//
//  Statistics.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/13.
//

import Foundation

struct Statistics: Codable {
    var viewCount: String?
    var favoriteCount: String?
    
    enum CodingKeys: CodingKey {
        case viewCount,
             favoriteCount
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        viewCount = try? rootContainer.decode(String.self, forKey: .viewCount)
        favoriteCount = try? rootContainer.decode(String.self, forKey: .favoriteCount)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(viewCount, forKey: .viewCount)
        try container.encodeIfPresent(favoriteCount, forKey: .favoriteCount)
        
    }
}

