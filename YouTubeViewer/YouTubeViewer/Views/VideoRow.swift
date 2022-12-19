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
    
    var body: some View {
        Button {
            isPresenting = true
        } label: {
            VStack(alignment: .leading, spacing: 10) {
                <#code#>
            }
        }
        .sheet(isPresented: $isPresenting) {
            VideoDetail(video: videoPreview.video)
        }

    }
}

struct VideoRow_Previews: PreviewProvider {
    static var previews: some View {
        VideoRow()
    }
}
