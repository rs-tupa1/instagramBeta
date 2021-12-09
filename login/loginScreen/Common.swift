//
//  TextInput.swift
//  login
//
//  Created by GMO on 12/6/21.
//

import SwiftUI

enum TypeInput {
    case email
    case password
    case text
}

struct CustomTextField: View {
    let placeholder: String
    var isPass: Bool = false
    var type: TypeInput = TypeInput.text
    @State private var isEmailValid : Bool = true
    @Binding var text: String
    
    var body: some View {
        
        VStack(alignment: .leading)  {
            
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    
                    Text(placeholder)
                        .foregroundColor(.white).opacity(0.5)
                        .padding(.leading)
                }
                if isPass {
                    
                    SecureField(
                        "",
                        text: self.$text
                    )
                    .onChange(of: text, perform: onChanged)
                    .padding()
                    .colorMultiply(.white)
                    .background(Color.white.opacity(0.1))
                    .foregroundColor(Color.white)
                } else {
                    
                    TextField(
                        "",
                        text: self.$text
                    )
                    .onChange(of: text, perform: onChanged)
                    .padding()
                    .colorMultiply(.white)
                    .background(Color.white.opacity(0.1))
                    .foregroundColor(Color.white)
                }
            }
            
            if !self.isEmailValid {
                
                switch self.type {
                case TypeInput.email:
                    
                    Text("Email is Not Valid")
                        .foregroundColor(Color.red)
                case TypeInput.password:
                    
                    Text("Password minimum 6 characters")
                        .foregroundColor(Color.red)
                case .text:
                    
                    EmptyView()
                }
            }
        }
    }
    
    func onChanged(value:String) {
        if textFieldValidatorEmail(value: self.text, type: self.type) {
            
            self.isEmailValid = true
        } else {
            self.isEmailValid = false
        }
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

struct BorderButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
            .contentShape(Rectangle())
            .background(Color.purple.opacity(0.3))
        
    }
}
