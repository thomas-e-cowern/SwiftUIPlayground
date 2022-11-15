//
//  FungiViewModel.swift
//  FungiFinder
//
//  Created by Thomas Cowern on 11/15/22.
//

import Foundation

struct FungiViewModel {
    let fungi: Fungi
    
    var fungiId: String {
        fungi.id ?? ""
    }
    
    var name: String {
        fungi.name
    }
    
    var photoUrl: String {
        fungi.url
    }
}
