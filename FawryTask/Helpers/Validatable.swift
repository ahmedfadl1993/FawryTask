//
//  Validatable.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation


protocol Validatable {
    
    func isValidEmail(email: String) -> Bool
    
    func isValidPassword(password: String) -> Bool
    
    /// Validate string using regular expression.
    /// - parameter string: The string that need to be validated.
    /// - parameter pattern: The regular expression pattern used in validation.
    func isValid(string: String, pattern: String) -> Bool
}

extension Validatable {
   
    func isValidEmail(email: String) -> Bool {
        return self.isValid(string: email, pattern: "^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z‌​]{2,4})$")
    }
    
    func isValidPassword(password: String) -> Bool {
        return self.isValid(string: password, pattern: "^.{6,15}")
    }
    
    func isValid(string: String, pattern: String) -> Bool {
        guard let expression = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return false
        }
        let matches = expression.matches(in: string, options: [], range: NSRange(location: 0, length: string.count))
        return matches.count > 0
    }
}
