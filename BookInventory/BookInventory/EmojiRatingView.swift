//
//  EmojiRatingView.swift
//  BookInventory
//
//  Created by Thomas Cowern New on 5/24/22.
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            Text("๐ซ")
        case 2:
            Text("๐")
        case 3:
            Text("๐คจ")
        case 4:
            Text("๐")
        default:
            Text("๐")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
