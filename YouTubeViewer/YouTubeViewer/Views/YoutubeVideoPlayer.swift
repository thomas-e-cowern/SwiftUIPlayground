//
//  YoutubeVideoPlayer.swift
//  YouTubeViewer
//
//  Created by Thomas Cowern on 12/19/22.
//

import SwiftUI
import WebKit

struct YoutubeVideoPlayer: UIViewRepresentable {
    var video: Video
    
    func makeUIView(context: Context) -> some UIView {
        // create webview
        let view = WKWebView()
        
        // create url
        let embedUrlString = Constants.YT_EMBED_URL + video.videoId
        
        // load the video in webview
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        view.load(request)
        
        // return webview
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct YoutubeVideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        YoutubeVideoPlayer(video: Video())
    }
}
