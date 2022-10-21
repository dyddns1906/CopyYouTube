//
//  LocationItem.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct LocationItem: Codable {
    var latitude: Double?
    var longitude: Double?
    var altitude: Double?

    private enum CodingKeys: String, CodingKey {
        case latitude,
             longitude,
             altitude
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try? rootContainer.decode(Double.self, forKey: .latitude)
        longitude = try? rootContainer.decode(Double.self, forKey: .longitude)
        altitude = try? rootContainer.decode(Double.self, forKey: .altitude)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(latitude, forKey: .latitude)
        try container.encodeIfPresent(longitude, forKey: .longitude)
        try container.encodeIfPresent(altitude, forKey: .altitude)
    }
}
