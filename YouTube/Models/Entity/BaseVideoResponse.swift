//
//  BaseVideoResponse.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/12.
//

import Foundation

struct BaseVideoResponse: Codable {
    var kind: String?
    var etag: String?
    var nextPageToken: String?
    var prevPageToken: String?
    var pageInfo: String?
    var items: String?
    
    private enum CodingKeys: String, CodingKey {
        case kind,
             etag,
             nextPageToken,
             prevPageToken,
             pageInfo,
             items
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        kind = try? rootContainer.decode(String.self, forKey: .kind)
        etag = try? rootContainer.decode(String.self, forKey: .etag)
        nextPageToken = try? rootContainer.decode(String.self, forKey: .nextPageToken)
        prevPageToken = try? rootContainer.decode(String.self, forKey: .prevPageToken)
        pageInfo = try? rootContainer.decode(String.self, forKey: .pageInfo)
        items = try? rootContainer.decode(String.self, forKey: .items)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(kind, forKey: .kind)
        try container.encodeIfPresent(etag, forKey: .etag)
        try container.encodeIfPresent(nextPageToken, forKey: .nextPageToken)
        try container.encodeIfPresent(prevPageToken, forKey: .prevPageToken)
        try container.encodeIfPresent(pageInfo, forKey: .pageInfo)
        try container.encodeIfPresent(items, forKey: .items)
        
    }
}
