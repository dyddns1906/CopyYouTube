//
//  BaseVideoItem.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct BaseVideoItem: Codable {
    var kind: String?
    var etag: String?
    var id: String?
    var snippet: Snippet?
    var contentDetails: ContentDetails?
    var status: VideoStatus?
    var statistics: Statistics?
    var player: [String:String]?
    var topicDetails: [TopicDetails]?
    var recordingDetails: RecordingDetails?
    var fileDetails: FileDetails?
    var processingDetails: ProcessingDetails?
    var suggestions: Suggestions?
    
    private enum CodingKeys: String, CodingKey {
        case kind,
             etag,
             id,
             snippet,
             contentDetails,
             status,
             statistics,
             player,
             topicDetails,
             recordingDetails,
             fileDetails,
             processingDetails,
             suggestions
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        kind = try? rootContainer.decode(String.self, forKey: .kind)
        etag = try? rootContainer.decode(String.self, forKey: .etag)
        id = try? rootContainer.decode(String.self, forKey: .id)
        snippet = try? rootContainer.decode(Snippet.self, forKey: .snippet)
        contentDetails = try? rootContainer.decode(ContentDetails.self, forKey: .contentDetails)
        status = try? rootContainer.decode(VideoStatus.self, forKey: .status)
        statistics = try? rootContainer.decode(Statistics.self, forKey: .statistics)
        player = try? rootContainer.decode([String:String].self, forKey: .player)
        topicDetails = try? rootContainer.decode([TopicDetails].self, forKey: .topicDetails)
        recordingDetails = try? rootContainer.decode(RecordingDetails.self, forKey: .recordingDetails)
        fileDetails = try? rootContainer.decode(FileDetails.self, forKey: .fileDetails)
        processingDetails = try? rootContainer.decode(ProcessingDetails.self, forKey: .processingDetails)
        suggestions = try? rootContainer.decode(Suggestions.self, forKey: .suggestions)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(kind, forKey: .kind)
        try container.encodeIfPresent(etag, forKey: .etag)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(snippet, forKey: .snippet)
        try container.encodeIfPresent(contentDetails, forKey: .contentDetails)
        try container.encodeIfPresent(status, forKey: .status)
        try container.encodeIfPresent(statistics, forKey: .statistics)
        try container.encodeIfPresent(player, forKey: .player)
        try container.encodeIfPresent(topicDetails, forKey: .topicDetails)
        try container.encodeIfPresent(recordingDetails, forKey: .recordingDetails)
        try container.encodeIfPresent(fileDetails, forKey: .fileDetails)
        try container.encodeIfPresent(processingDetails, forKey: .processingDetails)
        try container.encodeIfPresent(suggestions, forKey: .suggestions)
        
    }
}
