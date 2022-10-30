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
    
    private var cancelables: Set<AnyCancellable> = []
    
    init() {
        passthroughSubject.sink { (completion) in
            switch completion {
                
            case .finished:
                print("finished")
            case .failure(let err):
                print("Error: \(err.localizedDescription)")
            }
        } receiveValue: { (value) in
            print(value)
        }
        .store(in: &cancelables)
    }
    
    func startFetch() {
        Service.fetch { (result) in
            switch result {
                
            case .success(let value):
                self.passthroughSubject.send(value)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
