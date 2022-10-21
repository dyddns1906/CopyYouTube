//
//  ProcessingDetails.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct ProcessingDetails: Codable {
    var processingStatus: String?
    var processingProgress: ProcessingProgress?
    var processingFailureReason: String?
    var fileDetailsAvailability: String?
    var processingIssuesAvailability: String?
    var tagSuggestionsAvailability: String?
    var editorSuggestionsAvailability: String?
    var thumbnailsAvailability: String?

    private enum CodingKeys: String, CodingKey {
        case processingStatus,
             processingProgress,
             processingFailureReason,
             fileDetailsAvailability,
             processingIssuesAvailability,
             tagSuggestionsAvailability,
             editorSuggestionsAvailability,
             thumbnailsAvailability
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        processingStatus = try? rootContainer.decode(String.self, forKey: .processingStatus)
        processingProgress = try? rootContainer.decode(ProcessingProgress.self, forKey: .processingProgress)
        processingFailureReason = try? rootContainer.decode(String.self, forKey: .processingFailureReason)
        fileDetailsAvailability = try? rootContainer.decode(String.self, forKey: .fileDetailsAvailability)
        processingIssuesAvailability = try? rootContainer.decode(String.self, forKey: .processingIssuesAvailability)
        tagSuggestionsAvailability = try? rootContainer.decode(String.self, forKey: .tagSuggestionsAvailability)
        editorSuggestionsAvailability = try? rootContainer.decode(String.self, forKey: .editorSuggestionsAvailability)
        thumbnailsAvailability = try? rootContainer.decode(String.self, forKey: .thumbnailsAvailability)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(processingStatus, forKey: .processingStatus)
        try container.encodeIfPresent(processingProgress, forKey: .processingProgress)
        try container.encodeIfPresent(processingFailureReason, forKey: .processingFailureReason)
        try container.encodeIfPresent(fileDetailsAvailability, forKey: .fileDetailsAvailability)
        try container.encodeIfPresent(processingIssuesAvailability, forKey: .processingIssuesAvailability)
        try container.encodeIfPresent(tagSuggestionsAvailability, forKey: .tagSuggestionsAvailability)
        try container.encodeIfPresent(editorSuggestionsAvailability, forKey: .editorSuggestionsAvailability)
        try container.encodeIfPresent(thumbnailsAvailability, forKey: .thumbnailsAvailability)
    }
}
