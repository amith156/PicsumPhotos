//
//  PicsumPhotoCacheManager.swift
//  PicsumPhotos
//
//  Created by Amith Narayan on 27/07/2021.
//

import Foundation
import SwiftUI

class PicsumPhotoCacheManager {
    
    static let instace = PicsumPhotoCacheManager()
    
    private init() {
        
    }
    
    var picsumCache : NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 10
        cache.totalCostLimit = 1024 * 1024 * 1024 //1gb
        return cache
    }()
    
    func add(key: String, value: UIImage) {
        picsumCache.setObject(value, forKey: key as NSString)
    }
    
    
    func get(key: String) -> UIImage? {
        return picsumCache.object(forKey: key as NSString)
    }
    
    
    
    
}
