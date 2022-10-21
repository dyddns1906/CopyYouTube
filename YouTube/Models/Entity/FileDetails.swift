//
//  FileDetails.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct FileDetails: Codable {
    var fileName: String?
    var fileSize: Int?
    var fileType: String?
    var container: String?
    var videoStreams: [VideoStreamsItem]?
    var audioStreams: [AudioStreamsItem]?
    var durationMs: Int?
    var bitrateBps: Int?
    var recordingLocation: LocationItem?
    var creationTime: String?

    private enum CodingKeys: String, CodingKey {
        case fileName,
             fileSize,
             fileType,
             container,
             videoStreams,
             audioStreams,
             durationMs,
             bitrateBps,
             recordingLocation,
             creationTime
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        fileName = try? rootContainer.decode(String.self, forKey: .fileName)
        fileSize = try? rootContainer.decode(Int.self, forKey: .fileSize)
        fileType = try? rootContainer.decode(String.self, forKey: .fileType)
        container = try? rootContainer.decode(String.self, forKey: .container)
        videoStreams = try? rootContainer.decode([VideoStreamsItem].self, forKey: .videoStreams)
        audioStreams = try? rootContainer.decode([AudioStreamsItem].self, forKey: .audioStreams)
        durationMs = try? rootContainer.decode(Int.self, forKey: .durationMs)
        bitrateBps = try? rootContainer.decode(Int.self, forKey: .bitrateBps)
        recordingLocation = try? rootContainer.decode(LocationItem.self, forKey: .recordingLocation)
        creationTime = try? rootContainer.decode(String.self, forKey: .creationTime)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(fileName, forKey: .fileName)
        try container.encodeIfPresent(fileSize, forKey: .fileSize)
        try container.encodeIfPresent(fileType, forKey: .fileType)
        try container.encodeIfPresent(videoStreams, forKey: .videoStreams)
        try container.encodeIfPresent(audioStreams, forKey: .audioStreams)
        try container.encodeIfPresent(durationMs, forKey: .durationMs)
        try container.encodeIfPresent(bitrateBps, forKey: .bitrateBps)
        try container.encodeIfPresent(recordingLocation, forKey: .recordingLocation)
        try container.encodeIfPresent(creationTime, forKey: .creationTime)
    }
}
