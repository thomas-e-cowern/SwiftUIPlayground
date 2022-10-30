//
//  Service.swift
//  SwiftUICombine
//
//  Created by Thomas Cowern on 10/30/22.
//

import Foundation

struct ServiceError {
    static let invalid = NSError(domain: "Number 8 is invalid", code: 1)
}

struct Service {
    static let mockData = 1...10
    
    static func fetch(completion: @escaping (Result<String, Error>) -> ()) {
        
        
        mockData.forEach { value in
            let delay = DispatchTimeInterval.seconds(value)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                
                if value == 8 {
                    completion(.failure(ServiceError.invalid))
                } else {
                    completion(.success("\(value)"))
                }
            }
        }
    }
}
