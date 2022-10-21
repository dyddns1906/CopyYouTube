//
//  AudioStreamsItem.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct AudioStreamsItem: Codable {
    var channelCount: Int?
    var codec: String?
    var bitrateBps: Int?
    var vendor: String?

    private enum CodingKeys: String, CodingKey {
        case channelCount,
             codec,
             bitrateBps,
             vendor
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        channelCount = try? rootContainer.decode(Int.self, forKey: .channelCount)
        codec = try? rootContainer.decode(String.self, forKey: .codec)
        bitrateBps = try? rootContainer.decode(Int.self, forKey: .bitrateBps)
        vendor = try? rootContainer.decode(String.self, forKey: .vendor)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(channelCount, forKey: .channelCount)
        try container.encodeIfPresent(codec, forKey: .codec)
        try container.encodeIfPresent(bitrateBps, forKey: .bitrateBps)
        try container.encodeIfPresent(vendor, forKey: .vendor)
    }
}
