//
//  RecordingDetails.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct RecordingDetails: Codable {
    var locationDescription: String?
    var location: [LocationType:Double]?
    var recordingDate: String?

    private enum CodingKeys: String, CodingKey {
        case locationDescription,
             location,
             recordingDate
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        locationDescription = try? rootContainer.decode(String.self, forKey: .locationDescription)
        location = try? rootContainer.decode([LocationType:Double].self, forKey: .location)
        recordingDate = try? rootContainer.decode(String.self, forKey: .recordingDate)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(locationDescription, forKey: .locationDescription)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(recordingDate, forKey: .recordingDate)
    }
}
