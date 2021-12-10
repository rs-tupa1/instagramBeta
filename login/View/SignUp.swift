//
//  SignUp.swift
//  login
//
//  Created by GMO on 12/6/21.
//

import SwiftUI

struct SignUp: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var fullname: String = ""
    @State var username: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isActive: Bool = false
    @State private var isEmailValid: Bool = true
    @State private var isPasswordValid: Bool = true
    @State private var isFullNameValid: Bool = true
    @State private var isUserNameValid: Bool = true
    
    var body: some View {
        
        NavigationView {
            
            ZStack (alignment: .bottom) {
                
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                
                ScrollView {
                    
                    VStack (spacing: 16) {
                        
                        Image("plus_photo")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .padding()
                        
                        
                        CustomTextField(placeholder: "Email", type: TypeInput.email, isInputValid: self.$isEmailValid, text: self.$email)
                        
                        CustomTextField(placeholder: "Password", isPass: true, type: TypeInput.password, isInputValid: self.$isPasswordValid, text: self.$password)
                        
                        CustomTextField(placeholder: "Fullname", type: TypeInput.text, isInputValid: self.$isFullNameValid, text: self.$fullname)
                        
                        CustomTextField(placeholder: "Username", type: TypeInput.text, isInputValid: self.$isUserNameValid, text: self.$username)
                        
                        Button(action: {
                            
                            isEmptyInput()
                            action()
                        }) {
                            
                            Text("Sign Up")
                                .foregroundColor(.white)
                                .padding()
                        }
                        .buttonStyle(BorderButtonStyle())
                        .background(Color.purple.opacity(0.2))
                        .cornerRadius(5)
                        
                        NavigationLink (
                            "",
                            destination: Home()
                                .navigationBarTitle("")
                                .navigationBarHidden(true),
                            isActive: $isActive
                        )
                    }
                    .padding(.all)
                }
                
                HStack {
                    
                    Text("Already have an account?")
                        .foregroundColor(.white)
                    
                    Button("Sign In", action: {
                        
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    .foregroundColor(.white)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
    
    func action() {
        
        if !validate(email: email, password: password) || !(self.fullname.count > 0) || !(self.username.count > 0) {
            
            self.isActive =  false
            
            return;
        }
        self.isActive = true
    }
    
    func isEmptyInput() {
        
        if self.email.isEmpty {
            
            self.isEmailValid = false
        }
        
        if self.password.isEmpty {
            
            self.isPasswordValid = false
        }
        
        if self.fullname.isEmpty {
            
            self.isFullNameValid = false
        }
        
        if self.username.isEmpty {
            
            self.isUserNameValid = false
        }
    }
}
