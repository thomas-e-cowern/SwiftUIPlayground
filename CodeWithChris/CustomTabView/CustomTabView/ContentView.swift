//
//  ContentView.swift
//  CustomTabView
//
//  Created by Thomas Cowern on 11/29/22.
//

import SwiftUI

enum Tab {
    case Home
    case Email
    case Search
    case Favorites
    case Settings
}

struct TabInfo: Identifiable {
    var id = UUID()
    var view: Tab
    var icon: String
    var name: String
}

struct ContentView: View {
    
    @State var tabs = [TabInfo]()
    @State var selectedTab = Tab.Home
        
    var body: some View {
        GeometryReader  { geo in
            
            switch selectedTab {
            case Tab.Home:
                HomeView()
            case Tab.Email:
                EmailView()
            case Tab.Search:
                SearchView()
            case Tab.Favorites:
                FavoritesView()
            case Tab.Settings:
                SettingView()
            }
            VStack {
                
                Spacer()
                
                VStack {
                    Path({ path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: geo.size.width, y: 0))
                    })
                    .stroke(.gray)
                    HStack (spacing: 0) {
                        Spacer()
                        ForEach(tabs) { tab in
                            CustomTabBarButton(selectedTab: $selectedTab, tab: tab)
                                .frame(width: (geo.size.width - 40)/5)
                        }
                        Spacer()
                    }
                }
                .frame(height: 70)
                .background(.white)
            }
        }
        .onAppear {
            // Create tabs
            var newTabs = [TabInfo]()
            newTabs.append(TabInfo(view: Tab.Home, icon: "person", name: "Home"))
            newTabs.append(TabInfo(view: Tab.Email, icon: "envelope", name: "Email"))
            newTabs.append(TabInfo(view: Tab.Search, icon: "magnifyingglass", name: "Search"))
            newTabs.append(TabInfo(view: Tab.Favorites, icon: "star", name: "Favorites"))
            newTabs.append(TabInfo(view: Tab.Settings, icon: "person.fill", name: "Settings"))
            
            self.tabs = newTabs
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
