//
//  TopicDetails.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct TopicDetails: Codable {
    var topicIds: [String]?
    var relevantTopicIds: [String]?

    private enum CodingKeys: String, CodingKey {
        case topicIds,
             relevantTopicIds
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        topicIds = try? rootContainer.decode([String].self, forKey: .topicIds)
        relevantTopicIds = try? rootContainer.decode([String].self, forKey: .relevantTopicIds)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(topicIds, forKey: .topicIds)
        try container.encodeIfPresent(relevantTopicIds, forKey: .relevantTopicIds)
    }
}
