//
//  MainViewController.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

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
