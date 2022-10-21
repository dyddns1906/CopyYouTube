//
//  VideoStatus.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/21.
//

import Foundation

struct VideoStatus: Codable {
    var uploadStatus: String?
    var failureReason: String?
    var rejectionReason: String?
    var privacyStatus: String?
    var license: String?
    var embeddable: Bool?
    var publicStatsViewable: Bool?

    private enum CodingKeys: String, CodingKey {
        case uploadStatus,
             failureReason,
             rejectionReason,
             privacyStatus,
             license,
             embeddable,
             publicStatsViewable
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        uploadStatus = try? rootContainer.decode(String.self, forKey: .uploadStatus)
        failureReason = try? rootContainer.decode(String.self, forKey: .failureReason)
        rejectionReason = try? rootContainer.decode(String.self, forKey: .rejectionReason)
        privacyStatus = try? rootContainer.decode(String.self, forKey: .privacyStatus)
        license = try? rootContainer.decode(String.self, forKey: .license)
        embeddable = try? rootContainer.decode(Bool.self, forKey: .embeddable)
        publicStatsViewable = try? rootContainer.decode(Bool.self, forKey: .publicStatsViewable)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(uploadStatus, forKey: .uploadStatus)
        try container.encodeIfPresent(failureReason, forKey: .failureReason)
        try container.encodeIfPresent(rejectionReason, forKey: .rejectionReason)
        try container.encodeIfPresent(privacyStatus, forKey: .privacyStatus)
        try container.encodeIfPresent(license, forKey: .license)
        try container.encodeIfPresent(embeddable, forKey: .embeddable)
        try container.encodeIfPresent(publicStatsViewable, forKey: .publicStatsViewable)
    }
}
