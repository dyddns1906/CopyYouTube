//
//  ThumbnailsType.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/10/13.
//

import Foundation

enum ThumbnailsType: String, Codable {
    case defaults = "default",
         medium,
         high,
         standard,
         maxres
}
