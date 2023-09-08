//
//  LoginViewController.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 9/7/23.
//

import Foundation
import SwiftUI
import UIKit
import Firebase
import FirebaseCore
import FirebaseStorage
import FirebaseAuth

class LoginViewController: UIViewController, ObservableObject {
    
    @Published var loginBackgroundImage: UIImage = UIImage()
    
    func loadBackgroundImage() -> Void {
        let imageRef = Storage.storage().reference(withPath: Constants.StoragePaths.loginScreenImage_storagePath)
        
        imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
                print(error)
            } else {
                // Data for "images/island.jpg" is returned
                print("Loading image")
                self.loginBackgroundImage = UIImage(data: data!) ?? UIImage()
                print("I'm ready")
            }
        }
        print("I'm returning")
    }
    
    func loadLogin() -> any View {
        return Text("hello")
    }
}
