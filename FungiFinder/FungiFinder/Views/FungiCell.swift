//
//  FungiCell.swift
//  FungiFinder
//
//  Created by Thomas Cowern on 11/15/22.
//

import SwiftUI
import URLImage

struct FungiCell: View {
    
    let fungi: FungiViewModel
    
    var body: some View {
        VStack {
            VStack {
                URLImage(URL(string: fungi.photoUrl)!) {
                    // This view is displayed before download starts
                    EmptyView()
                } inProgress: { progress in
                    // Display progress
                    Text("Loading...")
                } failure: { error, retry in
                    // Display error and retry button
                    VStack {
                        Text(error.localizedDescription)
                        Button("Retry", action: retry)
                    }
                } content: { image in
                    // Downloaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Text(fungi.name)
            }
        }
    }
}

struct FungiCell_Previews: PreviewProvider {
    static var previews: some View {
        FungiCell()
    }
}
