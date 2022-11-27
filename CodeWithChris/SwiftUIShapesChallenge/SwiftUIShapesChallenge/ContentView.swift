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
                .padding()
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .frame(width: UIScreen.main.bounds.size.width, height: 40)
                    .padding()

                
            }
            
            HStack {
                Image(systemName: "envelope")
                TextField("Email", text: $email)
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
