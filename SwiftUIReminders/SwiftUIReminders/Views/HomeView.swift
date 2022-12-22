//
//  HomeView.swift
//  SwiftUIReminders
//
//  Created by Thomas Cowern on 12/22/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationSplitView {
            SidebarView()
            
        } detail: {
            Text("Main Screen")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
