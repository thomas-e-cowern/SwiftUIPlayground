//
//  ContentView.swift
//  NetworkingTest
//
//  Created by Thomas Cowern on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = UsersViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.users, id: \.id) { user in
                    UserView()
                        .listSectionSeparator(.automatic)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Users")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
