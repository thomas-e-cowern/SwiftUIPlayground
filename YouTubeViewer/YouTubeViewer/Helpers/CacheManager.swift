//
//  CacheManager.swift
//  YouTubeViewer
//
//  Created by Thomas Cowern on 12/16/22.
//

import Foundation

class CacheManager {
    static var cache = [String : Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        // Store the image data with the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        // get the data for the specified url
        return cache[url]
    }
}
