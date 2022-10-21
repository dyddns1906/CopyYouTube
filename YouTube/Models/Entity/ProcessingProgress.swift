//
//  ProcessingProgress.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct ProcessingProgress: Codable {
    var partsTotal: Int?
    var partsProcessed: Int?
    var timeLeftMs: Int?
    var vendor: String?

    private enum CodingKeys: String, CodingKey {
        case partsTotal,
             partsProcessed,
             timeLeftMs
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        partsTotal = try? rootContainer.decode(Int.self, forKey: .partsTotal)
        partsProcessed = try? rootContainer.decode(Int.self, forKey: .partsProcessed)
        timeLeftMs = try? rootContainer.decode(Int.self, forKey: .timeLeftMs)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(partsTotal, forKey: .partsTotal)
        try container.encodeIfPresent(partsProcessed, forKey: .partsProcessed)
        try container.encodeIfPresent(timeLeftMs, forKey: .timeLeftMs)
    }
}
