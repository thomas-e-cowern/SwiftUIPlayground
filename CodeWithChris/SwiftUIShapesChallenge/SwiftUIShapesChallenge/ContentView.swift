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
        VStack {
            
            ZStack {
                HStack {
                    Image(systemName: "person")
                    TextField("Name", text: $name)
                }
                .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray)
                    .frame(height: 40)
            }
            
            ZStack {
                HStack {
                    Image(systemName: "envelope")
                    TextField("Email", text: $email)
                }
                .padding(.horizontal)
                
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray)
                    .frame(height: 40)
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
