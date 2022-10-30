//
//  Service.swift
//  SwiftUICombine
//
//  Created by Thomas Cowern on 10/30/22.
//

import Foundation


struct Service {
    static let mockData = 1...10
    
    static func fetch(completion: @escaping (Result<String, Error>) -> ()) {
        
        
        mockData.forEach { value in
            let delay = DispatchTimeInterval.seconds(value)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                completion(.success("\(value)"))
            }
        }
    }
}
