//
//  Controller.swift
//  Instagram
//
//  Created by GMO on 12/9/21.
//

import SwiftUI

func validate(email: String, password: String) -> Bool {
    
    if !textFieldValidatorEmail(value: email, type: TypeInput.email) || !textFieldValidatorEmail(value: password, type: TypeInput.password) {
        
        return false
    }
    else {
        
        return true
    }
}

func textFieldValidatorEmail(value: String, type: TypeInput) -> Bool {
    let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
    
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    
    switch type {
    case TypeInput.email:
        
        return emailPredicate.evaluate(with: value)
        
    case TypeInput.password:
        
        return value.count > 5
    case .text:
        
        return true
    }
}
