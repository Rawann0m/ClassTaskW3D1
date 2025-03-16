//
//  AuthViewModel.swift
//  ClassTaskW3D1
//
//  Created by Rawan on 16/09/1446 AH.
//

import SwiftUI

class AuthViewModelLogin: ObservableObject {
    @Published var user = User(email: "", name:"",password: "", confirmPassword: "")
    @Published var isLogin = true
    
    // Simulate login process
    func login() {
        print("User: \(user.email), Password: \(user.password), IsLogin: \(isLogin)")
    }
    
    func toggleMode() {
        isLogin.toggle()
    }
}
