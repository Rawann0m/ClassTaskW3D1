//
//  ContentView.swift
//  ClassTaskW3D1
//
//  Created by Rawan on 16/09/1446 AH.
//

import SwiftUI
struct ContentView: View {
    var body: some View {
        NavigationView{
            //background
            ZStack{
                Color.purple.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    //show the picture
                    Image("pic1")
                        .resizable()
                        .frame(width: 300,height: 300)
                    Text("Welcome to my App!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    
                    Text("We start the journy of joy here!")
                        .padding()
                    
                    // Button to navigate to the SignUpView
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .foregroundColor(.purple)
                            .padding(.bottom)
                            .padding(.horizontal)
                    }
                    
                    // Button to navigate to the LoginView
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .foregroundColor(.purple)
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                .padding()
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
