//
//  ThumbnailModels.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/13.
//

import Foundation

struct ThumbnailModels: Codable {
    var url: String?
    var width: Int?
    var height: Int?
    
    enum CodingKeys: CodingKey {
        case url,
             width,
             height
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        url = try? rootContainer.decode(String.self, forKey: .url)
        width = try? rootContainer.decode(Int.self, forKey: .width)
        height = try? rootContainer.decode(Int.self, forKey: .height)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(width, forKey: .width)
        try container.encodeIfPresent(height, forKey: .height)
        
    }
}
