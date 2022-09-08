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
            ZStack {
                List {
                    ForEach(vm.users, id: \.id) { user in
                        UserView(user: user)
                            .listSectionSeparator(.automatic)
                    }
                }
                .listStyle(.plain)
            .navigationTitle("Users")
            }
            .onAppear(perform: vm.fetchUsers)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
