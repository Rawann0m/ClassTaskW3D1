//
//  SignUpView.swift
//  ClassTaskW3D1
//
//  Created by Rawan on 16/09/1446 AH.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel = AuthViewModelSignup()
    @ObservedObject var viewModelL = AuthViewModelLogin()
    @State private var isSecure: Bool = true
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
                VStack {
                    //image
                    Image("pic1")
                        .resizable()
                        .frame(width: 180,height: 180)
                    //sign up title
                    Text("Sign Up")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    //email textfiled
                    TextField("Email", text: $viewModel.user.email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                        .padding(.bottom)
                    //name textfiled
                    TextField("Name", text: $viewModel.user.name)
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
                    
                    //show confirm password or hide
                    ZStack(alignment: .trailing) {
                        // SecureField that hides text by default
                        if isSecure {
                            SecureField("Confirm Password", text: $viewModel.user.confirmPassword)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color.gray, lineWidth: 1))
                                .padding(.bottom)
                        } else {
                            // TextField that shows password if isSecure is false
                            TextField("Confirm Password", text: $viewModel.user.confirmPassword)
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
                    //signup button
                    Button(action: {
                        viewModel.signUp()
                    }) {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.purple))
                            .foregroundColor(.white)
                            .animation(.easeInOut(duration: 0.2),value:1.0)
                    }
                    
                    Spacer()
                    //show the message that if u already have an account u can log in
                    HStack { Text("Already have an account?")
                        NavigationLink(destination: LoginView()){
                            Text("Login")}
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
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Image(systemName: "arrow.left")
                            .foregroundColor(Color.purple)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }

                padding()
                
            }.navigationBarBackButtonHidden(true)
        .padding(.horizontal)
    }
}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
