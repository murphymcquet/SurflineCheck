//
//  SurflineCheckApp.swift
//  SurflineCheck
//
//  Created by Murphy McQuet on 8/16/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseDatabase
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      let settings = Firestore.firestore().settings
      settings.host = "127.0.0.1:8080"
      settings.cacheSettings = MemoryCacheSettings.init()
      settings.isSSLEnabled = false
      Firestore.firestore().settings = settings
      return true
  }
}

@main
struct SurflineCheckApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            Home()
        }
    }
}
