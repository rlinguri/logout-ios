//
//  AppDelegate.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// The app's centralized point of control and coordination
@main
class AppDelegate: UIResponder {
  
  /// The main application window
  var window: UIWindow?
  
  /// Global access to the current app delegate
  static var shared: AppDelegate {
    if let delegate = UIApplication.shared.delegate as? AppDelegate {
      return delegate
    } else {
      return AppDelegate()
    }
  }
  
}

/// UIApplicationDelegate Lifecycle
extension AppDelegate: UIApplicationDelegate {
  
  /// Called when the launch process is complete and the app is ready to run
  ///
  /// - Parameters:
  ///   - application: The singleton app object
  ///   - launchOptions: A dictionary indicating the reason the app was launched
  ///
  /// - Returns: Whether or not the app can handle the URL resource or continue a user activity
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    let controller: MainViewController = Scene.main.createViewController(parentController: nil)
    window.rootViewController = controller
    window.makeKeyAndVisible()
    self.window = window
    
    return true
  }
  
}
