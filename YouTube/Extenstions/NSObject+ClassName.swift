//
//  NSObject+ClassName.swift
//  YouTube
//
//  Created by Yongun Lim on 2022/09/27.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
