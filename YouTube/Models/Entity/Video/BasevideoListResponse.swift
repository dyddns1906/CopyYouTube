//
//  BasevideoListResponse.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/12.
//

import Foundation

//{
//  "kind": "youtube#video",
//  "etag": etag,
//  "id": string,
//  "snippet": {
//    "publishedAt": datetime,
//    "channelId": string,
//    "title": string,
//    "description": string,
//    "thumbnails": {
//      (key): {
//        "url": string,
//        "width": unsigned integer,
//        "height": unsigned integer
//      }
//    },
//    "channelTitle": string,
//    "tags": [
//      string
//    ],
//    "categoryId": string
//  },
//  "contentDetails": {
//    "duration": string,
//    "dimension": string,
//    "definition": string,
//    "caption": string,
//    "licensedContent": boolean,
//    "regionRestriction": {
//      "allowed": [
//        string
//      ],
//      "blocked": [
//        string
//      ]
//    },
//    "contentRating": {
//      "mpaaRating": string,
//      "tvpgRating": string,
//      "bbfcRating": string,
//      "chvrsRating": string,
//      "eirinRating": string,
//      "cbfcRating": string,
//      "fmocRating": string,
//      "icaaRating": string,
//      "acbRating": string,
//      "oflcRating": string,
//      "fskRating": string,
//      "kmrbRating": string,
//      "djctqRating": string,
//      "russiaRating": string,
//      "rtcRating": string,
//      "ytRating": string
//    }
//  },
//  "status": {
//    "uploadStatus": string,
//    "failureReason": string,
//    "rejectionReason": string,
//    "privacyStatus": string,
//    "license": string,
//    "embeddable": boolean,
//    "publicStatsViewable": boolean
//  },
//  "statistics": {
//    "viewCount": unsigned long,
//    "likeCount": unsigned long,
//    "dislikeCount": unsigned long,
//    "favoriteCount": unsigned long,
//    "commentCount": unsigned long
//  },
//  "player": {
//    "embedHtml": string
//  },
//  "topicDetails": {
//    "topicIds": [
//      string
//    ],
//    "relevantTopicIds": [
//      string
//    ]
//  },
//  "recordingDetails": {
//    "locationDescription": string,
//    "location": {
//      "latitude": double,
//      "longitude": double,
//      "altitude": double
//    },
//    "recordingDate": datetime
//  },
//  "fileDetails": {
//    "fileName": string,
//    "fileSize": unsigned long,
//    "fileType": string,
//    "container": string,
//    "videoStreams": [
//      {
//        "widthPixels": unsigned integer,
//        "heightPixels": unsigned integer,
//        "frameRateFps": double,
//        "aspectRatio": double,
//        "codec": string,
//        "bitrateBps": unsigned long,
//        "rotation": string,
//        "vendor": string
//      }
//    ],
//    "audioStreams": [
//      {
//        "channelCount": unsigned integer,
//        "codec": string,
//        "bitrateBps": unsigned long,
//        "vendor": string
//      }
//    ],
//    "durationMs": unsigned long,
//    "bitrateBps": unsigned long,
//    "recordingLocation": {
//      "latitude": double,
//      "longitude": double,
//      "altitude": double
//    },
//    "creationTime": string
//  },
//  "processingDetails": {
//    "processingStatus": string,
//    "processingProgress": {
//      "partsTotal": unsigned long,
//      "partsProcessed": unsigned long,
//      "timeLeftMs": unsigned long
//    },
//    "processingFailureReason": string,
//    "fileDetailsAvailability": string,
//    "processingIssuesAvailability": string,
//    "tagSuggestionsAvailability": string,
//    "editorSuggestionsAvailability": string,
//    "thumbnailsAvailability": string
//  },
//  "suggestions": {
//    "processingErrors": [
//      string
//    ],
//    "processingWarnings": [
//      string
//    ],
//    "processingHints": [
//      string
//    ],
//    "tagSuggestions": [
//      {
//        "tag": string,
//        "categoryRestricts": [
//          string
//        ]
//      }
//    ],
//    "editorSuggestions": [
//      string
//    ]
//  }
//}

struct BasevideoListResponse: Codable {
    var kind: String?
    var etag: String?
    var nextPageToken: String?
    var prevPageToken: String?
    var pageInfo: String?
    var items: String?
    
    private enum CodingKeys: String, CodingKey {
        case kind,
             etag,
             nextPageToken,
             prevPageToken,
             pageInfo,
             items
    }
    
    init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: CodingKeys.self)
        kind = try? rootContainer.decode(String.self, forKey: .kind)
        etag = try? rootContainer.decode(String.self, forKey: .etag)
        nextPageToken = try? rootContainer.decode(String.self, forKey: .nextPageToken)
        prevPageToken = try? rootContainer.decode(String.self, forKey: .prevPageToken)
        pageInfo = try? rootContainer.decode(String.self, forKey: .pageInfo)
        items = try? rootContainer.decode(String.self, forKey: .items)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(kind, forKey: .kind)
        try container.encodeIfPresent(etag, forKey: .etag)
        try container.encodeIfPresent(nextPageToken, forKey: .nextPageToken)
        try container.encodeIfPresent(prevPageToken, forKey: .prevPageToken)
        try container.encodeIfPresent(pageInfo, forKey: .pageInfo)
        try container.encodeIfPresent(items, forKey: .items)
        
    }
}
