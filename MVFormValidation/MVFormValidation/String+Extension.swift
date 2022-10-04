//
//  String+Extension.swift
//  MVFormValidation
//
//  Created by Thomas Cowern on 10/4/22.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,63}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return predicate.evaluate(with: self)
    }
    
}
