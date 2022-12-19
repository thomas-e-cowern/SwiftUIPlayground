//
//  VideoRow.swift
//  YouTubeViewer
//
//  Created by Thomas Cowern on 12/19/22.
//

import SwiftUI

struct VideoRow: View {
    @ObservedObject var videoPreview: VideoPreview
    @State private var isPresenting: Bool = false
    @State private var imageHeight: CGFloat = 0.0
    var body: some View {
        Button {
            isPresenting = true
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                
                GeometryReader { geometry in
                    Image(uiImage: UIImage(data: videoPreview.thumbnailData) ?? UIImage())
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width, height: geometry.size.width * 9 / 16)
                        .clipped()
                        .onAppear {
                            imageHeight = geometry.size.width * 9 / 16
                        }
                }
                .frame(height: imageHeight)
                
                Text(videoPreview.title)
                    .bold()
                
                Text(videoPreview.date)
                    .foregroundColor(.gray)
            }
            .font(.system(size: 19))
        }
        .sheet(isPresented: $isPresenting) {
            VideoDetail(video: videoPreview.video)
        }

    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow(videoPreview: VideoPreview(video: Video()))
    }
}
