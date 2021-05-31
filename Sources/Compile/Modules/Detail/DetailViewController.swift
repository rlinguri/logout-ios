//
//  DetailViewController.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

class DetailViewController: UIViewController, ViewController {
  
  // MARK: - Properties
  
  /// The detail module's view model
  var presenter: Presenter
  
  /// An array of child module routers
  var childRouters: [Router]?
  
  // MARK: - VIPER
  
  /// Required initializer
  ///
  /// - Parameter presenter: The module's view model
  required init(presenter: Presenter) {
    self.presenter = presenter
    super.init(nibName: nil, bundle: nil)
    self.presenter.viewController = self
  }
  
  // MARK: - UIViewController
  
  /// Required initializer (not implemented) for loading from a nib
  ///
  /// - Parameter coder: An instance of `NSCoder`
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  /// Called when the controller's view is loaded into memory
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.systemGray
  }
  
  /// Called when the view is about to be added to a view hierarchy
  ///
  /// - Parameter animated: whether or not the transition will be animated
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.view.backgroundColor = UIColor.systemGray.withAlphaComponent(1.0)
  }
  
}
