//
//  LoginController.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 9/2/23.
//

import Foundation

class CurrentUserController: ObservableObject {
    
    // Singleton instance
    static let Instance = CurrentUserController()
    
    // Current user
    private var currentUser: CurrentUser?
    
    // Utility function to get current user
    func GetCurrentUser() -> CurrentUser? {
        // If currentUser is nil, try to get user from defaults
        if (currentUser == nil) {
            if let storedUser = UserDefaults.standard.object(forKey: Constants.UserDefaults.currentUser) as? CurrentUser {
                currentUser = storedUser
            }
        }
        return currentUser
    }
    
    func LogIn(loggedInUser: CurrentUser) -> Void {
        // Save info to UserDefaults and set currentUser
        UserDefaults.standard.set(loggedInUser, forKey: Constants.UserDefaults.currentUser)
    }
    
    func LogOut() -> Void {
        // Remove info from UserDefaults and set currentUser to nil
        UserDefaults.standard.removeObject(forKey: Constants.UserDefaults.currentUser)
        self.currentUser = nil
    }
}
