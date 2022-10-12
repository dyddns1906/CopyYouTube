//
//  PageInfo.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/12.
//

import Foundation

struct PageInfo: Codable {
    var totalResults: Int?
    var resultsPerPage: Int?
    
    enum CodingKeys: CodingKey {
        case totalResults,
             resultsPerPage
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        totalResults = try? rootContainer.decode(Int.self, forKey: .totalResults)
        resultsPerPage = try? rootContainer.decode(Int.self, forKey: .resultsPerPage)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(totalResults, forKey: .totalResults)
        try container.encodeIfPresent(resultsPerPage, forKey: .resultsPerPage)
        
    }
}
