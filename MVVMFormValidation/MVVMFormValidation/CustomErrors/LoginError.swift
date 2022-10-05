//
//  LoginError.swift
//  MVVMFormValidation
//
//  Created by Thomas Cowern on 10/5/22.
//

import Foundation

enum LoginError: Error, LocalizedError {
    case emailIsEmpty
    case emailInvalid
    case passwordEmpty
    
    var errorDescription: String? {
        switch self {
        case .emailIsEmpty:
            return "Email cannot be empty"
        case .emailInvalid:
            return "Email is not in the correct format"
        case .passwordEmpty:
            return "Passwword cannot be empty"
        }
    }
}
