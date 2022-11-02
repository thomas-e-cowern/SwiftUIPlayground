//
//  AccountViewModel.swift
//  SiwftUIAuthentication
//
//  Created by Thomas Cowern on 11/2/22.
//

import Foundation

struct AccountViewModel {
    
    let account: Account
    
    let id = UUID()
    
    var name: String {
        return account.name
    }
    
    var balance: Double {
        return account.balance
    }
}
