//
//  ContentView.swift
//  SwiftUIShapesChallenge
//
//  Created by Thomas Cowern on 11/27/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    
    var body: some View {
        VStack(spacing: 8) {

            TextField("Name", text: $name)
                .textFieldStyle(CustomNameTextFieldStyle())

            TextField("Email", text: $email)
                .textFieldStyle(CustomEmailTextViewStyle())
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
