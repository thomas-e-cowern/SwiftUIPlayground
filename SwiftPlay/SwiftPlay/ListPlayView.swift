//
//  ListPlayView.swift
//  SwiftPlay
//
//  Created by Thomas Cowern New on 2/22/22.
//

import SwiftUI

struct ListPlayView: View {
    var body: some View {
        VStack {
            ForEach(1...10, id:\.self) { item in
                Text("\(item)")
            }
        }
    }
}

struct ListPlayView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListPlayView()
        }
    }
}
