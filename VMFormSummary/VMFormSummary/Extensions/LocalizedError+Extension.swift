//
//  LocalizedError+Extension.swift
//  VMFormSummary
//
//  Created by Thomas Cowern on 10/6/22.
//

import Foundation

extension LocalizedError {
    
    var id: Int {
        localizedDescription.hashValue
    }
    
}
