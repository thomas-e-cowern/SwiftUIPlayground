//
//  ContentView.swift
//  SiwftUIAuthentication
//
//  Created by Thomas Cowern on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Form {
                HStack {
                    Spacer()
                    Image(systemName: "lock.fill")
                }
                
                HStack {
                    Spacer()
                    Button("Login") {
                        
                    }
                    Button("Logoout") {
                        
                    }
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                Spacer()
                
                Button("Get Accounts") {
                    
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
