//
//  CustomTabBarButton.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

struct CustomTabBarButton: View {
    
    @Binding var selectedTab: Tab
    var tab: TabInfo
    
    var body: some View {
        VStack (spacing: 5) {
            Button {
                self.selectedTab = tab.view
            } label: {
                VStack {
                    Image(systemName: tab.icon)
                        .padding(.bottom, 4)
                    Text(tab.name)
                        .font(.caption)
                }
                .foregroundColor(tab.view == selectedTab ? .blue : .gray)
            }
        }
        .padding(.vertical)
        .frame(height: 60)
    }
}

struct CustomTabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarButton(selectedTab: .constant(Tab.Home), tab: TabInfo(view: Tab.Home, icon: "person", name: "Home"))
    }
}
