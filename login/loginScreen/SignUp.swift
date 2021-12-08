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
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.vertical)
                
                ScrollView {
                    
                    VStack (spacing: 16) {
                        
                        Image("plus_photo")
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .padding()
                                                
                        CustomTextField(placeholder: "Email", type: TypeInput.email, text: self.$email)
                        
                        CustomTextField(placeholder: "Password", isPass: true, type: TypeInput.password, text: self.$password)
                        
                        CustomTextField(placeholder: "Fullname", type: TypeInput.text, text: self.$fullname)
                        
                        CustomTextField(placeholder: "Username", type: TypeInput.text, text: self.$username)
                        
                        Button(action: {
                            
                        }) {
                            
                            NavigationLink ("Sign Up", destination: Home())
                                .foregroundColor(.white)
                                .padding()
                        }
                        .buttonStyle(BorderButtonStyle())
                        .background(Color.purple.opacity(0.2))
                        .cornerRadius(5)
                                            
                        Spacer()
                        
                        HStack {
                            
                            Text("Already have an account?")
                                .foregroundColor(.white)
                            
                            Button("Sign In", action: {
                                
                                self.presentationMode.wrappedValue.dismiss()
                            })
                            .foregroundColor(.white)
                        }
                    }
                    .padding(.all)
                }
            }
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}
