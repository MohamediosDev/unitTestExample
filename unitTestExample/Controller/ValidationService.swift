//
//  ValidationService.swift
//  unitTestExample
//
//  Created by Soda on 3/29/21.
//

import Foundation


struct ValidationService {
    
    func validateEmail(_ email:String?) throws -> String {
        guard let emaill = email else { throw ValidationError.invalidValue}
        guard emaill.count > 3 else {throw ValidationError.usernameTooShort}
        guard emaill.count < 20 else {throw ValidationError.usernameTooLong}
        return emaill
    }
    
    func validatepassWord(_ password:String?) throws -> String {
        guard let passWord = password else { throw ValidationError.invalidValue}
        guard passWord.count >= 8 else {throw ValidationError.passwordTooShort}
        guard passWord.count < 20 else {throw ValidationError.passwordTooLong}
        
        return passWord
    }
}

enum ValidationError: LocalizedError {
    case invalidValue
    case passwordTooLong
    case passwordTooShort
    case usernameTooLong
    case usernameTooShort
    
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value."
        case .passwordTooLong:
            return "Your password is too long."
        case .passwordTooShort:
            return "Your password is too short."
        case .usernameTooLong:
            return "Your username is too long."
        case .usernameTooShort:
            return "Your username is too short."
        }
        
    }
}
