//
//  ContentView.swift
//  SiwftUIAuthentication
//
//  Created by Thomas Cowern on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var loginVM = LoginViewModel()
    @StateObject private var accountLVM = AccountViewListModel()
    
    var body: some View {
        VStack {
            Form {
                HStack {
                    Spacer()
                    Image(systemName: loginVM.isAuthenticated ? "lock.fill" : "lock.open")
                }
                TextField("Username", text: $loginVM.username)
                TextField("Password", text: $loginVM.password)
                HStack {
                    Spacer()
                    Button("Login") {
                        loginVM.login()
                    }
                    Button("Logoout") {
                        loginVM.signOut()
                    }
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            VStack {
                
                Spacer()
                
                if loginVM.isAuthenticated && accountLVM.accounts.count > 0 {
                    List(accountLVM.accounts, id: \.id) { account in
                        HStack {
                            Text("\(account.name)")
                            Spacer()
                            Text(String(format: "$%.2f", account.balance))
                        }
                    }
                    .listStyle(PlainListStyle())
                } else {
                    Text("Login to see your accounts!")
                }
                                
                Spacer()
                
                Button("Get Accounts") {
                    accountLVM.getAllAccounts()
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
