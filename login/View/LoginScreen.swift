//
//  loginScreen.swift
//  login
//
//  Created by GMO on 12/3/21.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false
    @State private var isEmailValid: Bool = true
    @State private var isPasswordValid: Bool = true
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                
                VStack (spacing: 20) {
                    
                    
                    Image("Instagram_logo_white")
                        .padding()
                    
                    CustomTextField(placeholder: "Email", type: TypeInput.email, isInputValid: self.$isEmailValid, text: self.$email)
                    
                    CustomTextField(placeholder: "Password", isPass: true, type: TypeInput.password, isInputValid: self.$isPasswordValid, text: self.$password)
                    
                    Button(action: {
                        
                        
                        isEmptyInput()
                        self.isActive = validate(email: email, password: password)
                    }) {
                        
                        Text("Log In")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(BorderButtonStyle())
                    .cornerRadius(5)
                    
                    NavigationLink (
                        "",
                        destination: Home()
                            .navigationBarTitle("")
                            .navigationBarHidden(true),
                        isActive: $isActive
                    )
                    
                    HStack {
                        
                        Text("Forgot your password?")
                            .foregroundColor(.white)
                        
                        Button (" Get help siging in.", action: {})
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    HStack {
                        
                        Text("Don't have an account?")
                            .foregroundColor(.white)
                        
                        NavigationLink ("Sign Up", destination: SignUp())
                            .foregroundColor(.white)
                    }
                }
                .padding(.all)
            }
            .navigationBarHidden(true)
        }
    }
    
    func isEmptyInput() {
        
        if self.email.isEmpty {
            
            self.isEmailValid = false
        }
        
        if self.password.isEmpty {
            
            self.isPasswordValid = false
        }
    }
}
