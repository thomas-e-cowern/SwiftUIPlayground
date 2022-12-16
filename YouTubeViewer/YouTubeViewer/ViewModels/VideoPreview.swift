//
//  VideoPreview.swift
//  YouTubeViewer
//
//  Created by Thomas Cowern on 12/16/22.
//

import Foundation
import Alamofire

class VideoPreview: ObservableObject {
    
    @Published var thumbnailData = Data()
    @Published var title: String
    @Published var date: String
    
    var video: Video
    
    init(video: Video) {
        // set video and title
        self.video = video
        self.title = video.title
        
        // set date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM, d, yyyy"
        self.date = df.string(from: video.published)
        
        // download image data
        guard video.thumbnail != "" else { return }
        
        // check cache befor download
        if let cachedData = CacheManager.getVideoCache(video.thumbnail) {
            thumbnailData = cachedData
            return
        }
        
        // get url from thumbnail
        guard let url = URL(string: video.thumbnail) else { return }
        
        // create request
        AF.request(url).validate().responseData { response in
            if let data = response.data {
                // save data to cache
                CacheManager.setVideoCache(video.title, data)
                
                // set image
                self.thumbnailData = data
            }
        }
    }
    
}
