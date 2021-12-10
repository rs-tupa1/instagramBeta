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
    @Binding var isInputValid : Bool
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
            
            if !self.isInputValid {
                
                switch self.type {
                case TypeInput.email:
                    
                    Text("Email is Not Valid")
                        .foregroundColor(Color.red)
                case TypeInput.password:
                    
                    Text("Password minimum 6 characters")
                        .foregroundColor(Color.red)
                case .text:
                    
                    Text("Can't be left empty")
                        .foregroundColor(Color.red)
                }
            }
        }
    }
    
    func onChanged(value:String) {
        if textFieldValidatorEmail(value: self.text, type: self.type) {
            
            self.isInputValid = true
        } else {
            self.isInputValid = false
        }
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
