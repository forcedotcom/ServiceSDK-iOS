//
//  AppDelegate.swift
//  SnapinsSDKExample
//
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
    
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    // Run the Snapins configuration process
    SnapinsConfig.instance.initialize()
    
    return true
  }

}

