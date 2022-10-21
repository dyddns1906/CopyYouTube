//
//  Suggestions.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct Suggestions: Codable {
    var processingErrors: [String]?
    var processingWarnings: [String]?
    var processingHints: [String]?
    var tagSuggestions: [TagSuggestions]?
    var editorSuggestions: [String]?

    private enum CodingKeys: String, CodingKey {
        case processingErrors,
             processingWarnings,
             processingHints,
             tagSuggestions,
             editorSuggestions
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        processingErrors = try? rootContainer.decode([String].self, forKey: .processingErrors)
        processingWarnings = try? rootContainer.decode([String].self, forKey: .processingWarnings)
        processingHints = try? rootContainer.decode([String].self, forKey: .processingHints)
        tagSuggestions = try? rootContainer.decode([TagSuggestions].self, forKey: .tagSuggestions)
        editorSuggestions = try? rootContainer.decode([String].self, forKey: .editorSuggestions)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(processingErrors, forKey: .processingErrors)
        try container.encodeIfPresent(processingWarnings, forKey: .processingWarnings)
        try container.encodeIfPresent(processingHints, forKey: .processingHints)
        try container.encodeIfPresent(tagSuggestions, forKey: .tagSuggestions)
        try container.encodeIfPresent(editorSuggestions, forKey: .editorSuggestions)
    }
}
