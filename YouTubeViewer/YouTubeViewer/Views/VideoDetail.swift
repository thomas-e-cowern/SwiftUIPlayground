//
//  VideoDetail.swift
//  YouTubeViewer
//
//  Created by Thomas Cowern on 12/19/22.
//

import SwiftUI

struct VideoDetail: View {
    var video: Video
    
    var date: String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM, d, yyyy"
        return df.string(from: video.published)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(video.title)
                .bold()
            Text(date)
                .foregroundColor(.gray)
            YoutubeVideoPlayer(video: video)
                .aspectRatio(CGSize(width: 1200, height: 720), contentMode: .fit)
            ScrollView {
                Text(video.description)
            }
        }
        .font(.system(size: 19))
        .padding()
        .padding(.top, 40)
    }
}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail(video: Video())
    }
}
