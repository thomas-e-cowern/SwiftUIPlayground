//
//  MessageView.swift
//  LetsChat
//
//  Created by Thomas Cowern on 11/16/22.
//

import SwiftUI

enum MessageStyle {
    case primary
    case secondary
}

struct MessageView: View {
    var body: some View {
        VStack(alignment: style == .primary ? .trailing : .leading) {
            
            if style == .primary {
                Text(messageText).withPrimaryTextStyle()
                    .lineLimit(nil)
            } else {
                Text(messageText).withSecondaryTextStyle()
                    .lineLimit(nil)
            }
            
            Text(username)
                .font(.caption)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
