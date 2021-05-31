//
//  MainViewController.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// The Main navigation view controller
class MainViewController: UINavigationController, ViewController {
  
  // MARK: - Properties
  
  /// The module's view modal
  var presenter: Presenter
  
  /// An array of child routers
  var childRouters: [Router]?
  
  /// The master scene's controller (page 1)
  var masterController: MasterViewController!
  
  /// The detail scene's controller (page 2)
  var detailController: DetailViewController!
  
  /// The login screen's controller
  var loginController: LoginViewController!
  
  // MARK: - MainViewController
  
  /// Show the login as a modal
  ///
  /// - Parameter removeStack: whether or not to reset the stack
  func presentLogin(removeStack: Bool) {
    // self.loginController.modalPresentationStyle = .fullScreen
    self.present(self.loginController, animated: true) {
      if removeStack {
        self.viewControllers.removeAll()
      }
    }
  }
  
  /// Show the detail view with push
  func pushDetail() {
    self.pushViewController(self.detailController, animated: true)
  }
  
  /// Dismiss the login modal
  func dismissLogin() {
    if !self.viewControllers.contains(self.masterController) {
      self.pushViewController(self.masterController, animated: false)
    }
    self.loginController.dismiss(animated: true)
  }
  
  // MARK: - VIPER
  
  /// Initialize the the view controller
  ///
  /// - Parameter presenter: The module's presenter
  required init(presenter: Presenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
    
    self.masterController = Scene.master.createViewController(parentController: self)
    self.detailController = Scene.detail.createViewController(parentController: self)
    self.loginController = Scene.login.createViewController(parentController: self)
    
    self.presenter.viewController = self
    self.isNavigationBarHidden = true
  }
  
  /// Receive entity from child router
  ///
  /// - Parameter entity: The `App` instance
  func post(entity: Entity) {
    OperationQueue.main.addOperation {
      if let entity = entity as? App {
        switch entity.event {
        case .didTapLogout:
          self.presentLogin(removeStack: entity.scene == .detail)
        case .didTapDetail:
          self.pushDetail()
        case .didTapMaster:
          self.popToRootViewController(animated: true)
        case .didTapLogin:
          self.dismissLogin()
        default:
          break
        }
      }
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
      if let routers = self.childRouters {
        for router in routers {
          router.notify(entity: entity)
        }
      }
    }
  }
  
  // MARK: - UIViewController
  
  /// Required initializer (not implemented) for loading from a nib
  ///
  /// - Parameter coder: An instance of `NSCoder`
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  /// Called when the controller's view is loaded into memory
  override func viewDidLoad() {
    super.viewDidLoad()
    self.pushViewController(self.masterController, animated: false)
  }
  
}
