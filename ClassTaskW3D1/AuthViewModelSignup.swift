//
//  AuthViewModelSignup.swift
//  ClassTaskW3D1
//
//  Created by Rawan on 16/09/1446 AH.
//

import SwiftUI

class AuthViewModelSignup: ObservableObject {
    @Published var user = User(email: "", name:"",password: "", confirmPassword: "")
    @Published var isSignUp = true
    
    // Simulate sign-up process
    func signUp() {
        if user.password == user.confirmPassword {
            print("User Signed Up: \(user.email), Password: \(user.password)")
        } else {
            // Handle password mismatch
            print("Passwords do not match!")
        }
    }
    
    func toggleMode() {
        isSignUp.toggle()
    }
}
