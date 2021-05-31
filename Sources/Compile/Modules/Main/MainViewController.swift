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

  // MARK: - VIPER
  
  /// Initialize the the view controller
  ///
  /// - Parameter presenter: The module's presenter
  required init(presenter: Presenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
    self.presenter.viewController = self
  }
    
  // MARK: - UIViewController
  
  /// Required initializer (not implemented) for loading from a nib
  ///
  /// - Parameter coder: An instance of `NSCoder`
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
