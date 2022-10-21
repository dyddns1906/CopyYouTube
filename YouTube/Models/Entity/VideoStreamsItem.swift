//
//  VideoStreamsItem.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct VideoStreamsItem: Codable {
    var widthPixels: Int?
    var heightPixels: Int?
    var frameRateFps: Double?
    var aspectRatio: Double?
    var codec: String?
    var bitrateBps: Int?
    var rotation: String?
    var vendor: String?

    private enum CodingKeys: String, CodingKey {
        case widthPixels,
             heightPixels,
             frameRateFps,
             aspectRatio,
             codec,
             bitrateBps,
             rotation,
             vendor
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        widthPixels = try? rootContainer.decode(Int.self, forKey: .widthPixels)
        heightPixels = try? rootContainer.decode(Int.self, forKey: .heightPixels)
        frameRateFps = try? rootContainer.decode(Double.self, forKey: .frameRateFps)
        aspectRatio = try? rootContainer.decode(Double.self, forKey: .aspectRatio)
        codec = try? rootContainer.decode(String.self, forKey: .codec)
        bitrateBps = try? rootContainer.decode(Int.self, forKey: .bitrateBps)
        rotation = try? rootContainer.decode(String.self, forKey: .rotation)
        vendor = try? rootContainer.decode(String.self, forKey: .vendor)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(widthPixels, forKey: .widthPixels)
        try container.encodeIfPresent(heightPixels, forKey: .heightPixels)
        try container.encodeIfPresent(frameRateFps, forKey: .frameRateFps)
        try container.encodeIfPresent(aspectRatio, forKey: .aspectRatio)
        try container.encodeIfPresent(codec, forKey: .codec)
        try container.encodeIfPresent(bitrateBps, forKey: .bitrateBps)
        try container.encodeIfPresent(rotation, forKey: .rotation)
        try container.encodeIfPresent(vendor, forKey: .vendor)
    }
}
