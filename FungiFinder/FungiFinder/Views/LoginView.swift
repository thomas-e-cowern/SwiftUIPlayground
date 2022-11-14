//
//  LoginView.swift
//  FungiFinder
//
//  Created by Thomas Cowern on 11/14/22.
//

import SwiftUI

struct LoginView: View {
    
    @State var isPresented: Bool = false
    @State var isActive: Bool = false
    @State private var path: [Bool] = []
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image("mushroom")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .padding(.bottom, 20)
                
                TextField("Username", text: $email)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                   
                Spacer()
                
                VStack {
                    Button("Login") {
                        isActive = true
                        
                        if isActive {
                            path.append(isActive)
                        }
                    }
                    .navigationDestination(for: Bool.self, destination: { value in
                        FungiListView()
                    })
                    .buttonStyle(PrimaryButtonStyle())
                    .padding(.bottom, 10)
                }
                
                Button("Create account") {
                    isPresented = true
                }.buttonStyle(SecondaryButtonStyle())
               
                Spacer()
                
            }
            .padding()
            .defaultBackgroundView()
            .sheet(isPresented: $isPresented, content: {
                RegisterView()
            })
        .navigationTitle("Fungi Finder")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
