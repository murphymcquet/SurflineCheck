//
//  LoginView.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 9/3/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth
import UIKit

struct LoginView: View {
    @StateObject var loginViewController = LoginViewController()
    @State var username: String = ""
    @State var password: String = ""
    
    private var userInputOverlay: some View {
        VStack{
            TextField(text: $username, prompt: Text("Username")) {
                Text("Username")
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .background(Color.white)
            .padding(.bottom)
            
            SecureField(text: $password, prompt: Text("Password")) {
                Text("Password")
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .background(Color.pink)
        }
    }
    
    private var backgroundImage: some View {
        Image(uiImage: loginViewController.loginBackgroundImage)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.top)
            .edgesIgnoringSafeArea(.bottom)
            .onAppear() {
                loginViewController.loadBackgroundImage()
            }
    }
    
    var body: some View {
        ZStack {
            backgroundImage
            var inputWidth = CGFloat(UIScreen.main.bounds.width * 0.9)
            HStack {
                userInputOverlay.frame(width: inputWidth)
            }
        }
        
        /*
        ZStack {
            HStack
            {
                userInputOverlay
            }
            .padding()
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            backgroundImage
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
        .edgesIgnoringSafeArea(.top)
        .edgesIgnoringSafeArea(.bottom)
         */
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
