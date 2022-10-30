//
//  ContentViewModel.swift
//  SwiftUICombine
//
//  Created by Thomas Cowern on 10/30/22.
//

import Foundation
import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    
    let passthroughSubject = PassthroughSubject<String, Error>()
    
    init() {
        let cancelable = passthroughSubject.sink { (completion) in
            print(completion)
        } receiveValue: { (value) in
            print(value)
        }
    }
}
