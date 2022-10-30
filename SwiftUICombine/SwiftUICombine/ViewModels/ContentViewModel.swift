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
    
    @Published var time: String = "0 seconds"
    @Published var seconds: String = "0 seconds"
    
    private var cancelables: Set<AnyCancellable> = []
    
    init() {
        passthroughSubject
            .dropFirst()
            .filter({ (value) -> Bool in
                value != "5"
            })
            .map { value in
                return value + " seconds"
            }
            .sink { (completion) in
            switch completion {
                
            case .finished:
                print("finished")
                self.time = "Finished"
            case .failure(let err):
                print("Error: \(err.localizedDescription)")
                self.time = err.localizedDescription
            }
        } receiveValue: { (value) in
            self.time = value
        }
        .store(in: &cancelables)
    }
    
    func startFetch() {
        Service.fetch { (result) in
            switch result {
                
            case .success(let value):
                if value == "10" {
                    self.passthroughSubject.send(completion: .finished)
                } else {
                    self.passthroughSubject.send(value)
                }
                self.seconds = value + " seconds"
            case .failure(let err):
                self.passthroughSubject.send(completion: .failure(err))
                self.seconds = err.localizedDescription
            }
        }
    }
}
