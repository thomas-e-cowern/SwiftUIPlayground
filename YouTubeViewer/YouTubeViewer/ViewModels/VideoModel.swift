//
//  VideoModel.swift
//  YouTubeViewer
//
//  Created by Thomas Cowern on 12/16/22.
//

import Foundation
import Alamofire

class VideoModel: ObservableObject {
    @Published var videos = [Video]()
    
    init() {
        getVideos()
    }
    
    func getVideos() {
        // crate url object
        guard let url = URL(string: "\(Constants.API_URL)/playListItems") else {
            print("DEBUG: Problem getting url in VideoModel")
            return
        }
        
        // Decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        // Crate URL request
        AF.request(
            url,
            parameters: ["part":"snippet" "playlistId":]
        )
    }
    
}
