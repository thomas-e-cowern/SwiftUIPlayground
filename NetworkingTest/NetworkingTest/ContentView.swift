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
                
                if vm.isRefreshing {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.blue))
                        .scaleEffect(4.0, anchor: .center)
                } else {
                    List {
                        ForEach(vm.users, id: \.id) { user in
                            UserView(user: user)
                                .listSectionSeparator(.automatic)
                        }
                    }
                    .listStyle(.plain)
                    .navigationTitle("Users")

                }
            }
            .onAppear(perform: vm.fetchUsers)
            .alert(isPresented: $vm.hasError, error: vm.error) {
                Button(action: vm.fetchUsers) {
                    Text("Retry")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
