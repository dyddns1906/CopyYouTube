//
//  StatusModels.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/13.
//

import Foundation

struct StatusModels: Codable {
    var uploadStatus: String?
    var privacyStatus: String?
    var license: String?
    var embeddable: Bool?
    var publicStatsViewable: Bool?
    var madeForKids: Bool?
    
    enum CodingKeys: CodingKey {
        case uploadStatus,
             privacyStatus,
             license,
             embeddable,
             publicStatsViewable,
             madeForKids
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        uploadStatus = try? rootContainer.decode(String.self, forKey: .uploadStatus)
        privacyStatus = try? rootContainer.decode(String.self, forKey: .privacyStatus)
        license = try? rootContainer.decode(String.self, forKey: .license)
        embeddable = try? rootContainer.decode(Bool.self, forKey: .embeddable)
        publicStatsViewable = try? rootContainer.decode(Bool.self, forKey: .publicStatsViewable)
        madeForKids = try? rootContainer.decode(Bool.self, forKey: .madeForKids)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(uploadStatus, forKey: .uploadStatus)
        try container.encodeIfPresent(privacyStatus, forKey: .privacyStatus)
        try container.encodeIfPresent(license, forKey: .license)
        try container.encodeIfPresent(embeddable, forKey: .embeddable)
        try container.encodeIfPresent(publicStatsViewable, forKey: .publicStatsViewable)
        try container.encodeIfPresent(madeForKids, forKey: .madeForKids)
        
    }
}
