//
//  SidebarView.swift
//  SwiftUIReminders
//
//  Created by Thomas Cowern on 12/22/22.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        VStack {
            Text("Items: 0")
            
            List(1...5, id: \.self) { index in
                Text("List \(index)")
            }
            Spacer()
            Button("Add List") {
                
            }
            .padding(.bottom, 10)
        }
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
