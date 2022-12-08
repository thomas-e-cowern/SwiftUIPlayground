//
//  ContentView.swift
//  FilterListExample
//
//  Created by Thomas Cowern on 12/8/22.
//

import SwiftUI

struct ContentView: View {
    
    let users = Bundle.main.decode([User].self, from: "users.json")
    @State private var filteredItems = [User]()
    @State private var filterString = ""
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    TextField("Type to filter", text: $filterString.onChange(applyFilter))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    List(filteredItems) { user in
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.address)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onAppear(perform: applyFilter)

                }
                .navigationBarTitle("Address Book")
            }
        }
        .padding()
    }
    
    func applyFilter() {
        let cleanedFilter = filterString.trimmingCharacters(in: .whitespacesAndNewlines)

        if cleanedFilter.isEmpty {
            filteredItems = users
        } else {
            filteredItems = users.filter { $0.name
                    .localizedCaseInsensitiveContains(cleanedFilter) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
