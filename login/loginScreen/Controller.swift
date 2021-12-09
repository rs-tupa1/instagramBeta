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
