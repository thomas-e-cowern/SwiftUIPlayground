//
//  ContentView.swift
//  FilterListExample
//
//  Created by Thomas Cowern on 12/8/22.
//

import SwiftUI

struct ContentView: View {
    
    let users = Bundle.main.decode([User].self, from: "users.json")
    
    var body: some View {
        VStack {
            NavigationView {
                
                .navigationBarTitle("Address Book")
            }
        }
        .padding()
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
