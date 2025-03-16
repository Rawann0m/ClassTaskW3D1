//
//  LoginView.swift
//  ClassTaskW3D1
//
//  Created by Rawan on 16/09/1446 AH.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = AuthViewModelLogin()
    @ObservedObject var viewModelS = AuthViewModelSignup()
    @State private var isSecure: Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            VStack {
                //show the image
                Image("pic1")
                    .resizable()
                    .frame(width: 200,height: 200)
                //login  title
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                //textfiled for the email
                TextField("Email", text: $viewModel.user.email)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                    .padding(.bottom)
                
                //show password or hide
                ZStack(alignment: .trailing) {
                    // SecureField that hides text by default
                    if isSecure {
                        SecureField("Password", text: $viewModel.user.password)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                            .padding(.bottom)
                    } else {
                        // TextField that shows password if isSecure is false
                        TextField("Password", text: $viewModel.user.password)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                            .padding(.bottom)
                    }
                    
                    // Eye icon
                    Button(action: {
                        isSecure.toggle()
                    }) {
                        Image(systemName: isSecure ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                //log in button
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.purple))
                        .foregroundColor(.white)
                        .animation(.easeInOut(duration: 0.2),value:1.0)
                }
                //forgot password button
                Button(action:{
                    
                }){
                    Text("Forgot password ? ")
                }
                
                Spacer()
                //show the message that if i dont account u can signup
                HStack{
                    Text("Don't have an account?" )
                    NavigationLink(destination: SignUpView()){
                        Text("Signup")}
                }
                //show the 3 icons with the link to the websites
                HStack{
                    Link(destination: URL(string: "https://www.google.com")!) {
                        Image("google_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .scaleEffect(5)
                            .padding()
                            .background(Circle().fill(Color.gray.opacity(0.1)))
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    }
                    Link(destination: URL(string: "https://facebook.com")!) {
                        Image("facebook_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .scaleEffect(4)
                            .padding()
                            .background(Circle().fill(Color.gray.opacity(0.1)))
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    }
                    Link(destination: URL(string: "https://www.apple.com")!) {
                        Image("apple_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 10, height: 10)
                            .scaleEffect(3)
                            .padding()
                            .background(Circle().fill(Color.gray.opacity(0.1)))
                            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                    }
                }
                
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color.purple)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            
        }
        
        .navigationBarBackButtonHidden(true)
        .padding()
        
    }
       // .padding()
}
#Preview {
    LoginView()
}
