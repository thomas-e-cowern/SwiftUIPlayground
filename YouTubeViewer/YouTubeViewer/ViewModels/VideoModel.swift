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
        guard let url = URL(string: "\(Constants.API_URL)/playlists?part=snippet&id=\(Constants.PLAYLISTID)&key=\(Constants.API_KEY)") else {
            print("DEBUG: Problem getting url in VideoModel")
            return
        }
        print("URL: \(url)")
        // Decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
//        let parameters: [String: [String]] = [
//            "part": ["snippet"],
//            "id": ["\(Constants.PLAYLISTID)"],
//            "key": ["\(Constants.API_KEY)"]
//        ]

        // Crate URL request
        AF.request(
            url
//            method: .get,
//            parameters: ["part" : "snippet", "id" : "\(Constants.PLAYLISTID)", "key" : "\(Constants.API_KEY)"]
//            parameters: parameters
        )
        .validate()

        .responseDecodable(of: Response.self, decoder: decoder) { response in
            print("DEBUG: Response: \(response)")
            // Check call success
            switch response.result {
            case .success:
                break
            case .failure(let error):
                print("DEBUG: Failure in responseDecodable: \(error.localizedDescription)")
                return
            }

            // Update UI with videos
            if let items = response.value?.items {
                self.videos = items
            }

        }
    }
    
}
