//
//  TagSuggestions.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct TagSuggestions: Codable {
    var tag: String?
    var categoryRestricts: [String]?

    private enum CodingKeys: String, CodingKey {
        case tag,
             categoryRestricts
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        tag = try? rootContainer.decode(String.self, forKey: .tag)
        categoryRestricts = try? rootContainer.decode([String].self, forKey: .categoryRestricts)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(tag, forKey: .tag)
        try container.encodeIfPresent(categoryRestricts, forKey: .categoryRestricts)
    }
}
