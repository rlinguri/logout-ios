//
//  LoginViewController.swift
//  login
//
//  Created by Digices LLC on 5/30/21.
//

import UIKit

class LoginViewController: UIViewController, ViewController {
  
  // MARK: - Properties
  
  /// The login module's view model
  var presenter: Presenter
  
  /// An array of child module routers
  var childRouters: [Router]?
  
  // MARK: - Outlets / Subviews
  
  /// The label to indicate which page is being displayed
  let titleLabel: UILabel = ViewFactory.createLabel()
  
  /// The bright, shiny candy-like button for logging in
  let loginButton: UIButton = ViewFactory.createButton()
  
  // MARK: - Actions / Selectors
  
  /// Login button action
  ///
  /// - Parameter sender: the button
  @objc func didTapLogin(_ sender: UIButton) {
    sender.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
  }
  
  // MARK: - LoginViewController
  
  /// Configure subviews and add to view hierarchy
  private func setupSubviews() {
    self.titleLabel.text = "Login Screen"
    
    self.view.addSubview(self.titleLabel)
    
    self.loginButton.addTarget(
      self,
      action: #selector(LoginViewController.didTapLogin(_:)),
      for: .touchUpInside
    )
    
    self.loginButton.setTitle("Login", for: .normal)
    
    self.view.addSubview(self.loginButton)
  }
  
  /// Set and activate Autolayout constraints
  private func setupConstraints() {
    self.loginButton.centerYAnchor.constraint(
      equalTo: self.view.centerYAnchor
    ).isActive = true
    
    self.loginButton.centerXAnchor.constraint(
      equalTo: self.view.centerXAnchor
    ).isActive = true
    
    self.loginButton.widthAnchor.constraint(equalToConstant: 108).isActive = true
    self.loginButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    self.titleLabel.leadingAnchor.constraint(
      equalTo: self.view.leadingAnchor,
      constant: 17.0
    ).isActive = true
    
    self.titleLabel.trailingAnchor.constraint(
      equalTo: self.view.trailingAnchor,
      constant: -17.0
    ).isActive = true
    
    self.titleLabel.topAnchor.constraint(
      equalTo: self.view.safeAreaLayoutGuide.topAnchor,
      constant: 108.0
    ).isActive = true
    
    self.titleLabel.heightAnchor.constraint(equalToConstant: 36.0).isActive = true
  }
  
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
    fatalError("init(coder:) has not been implemented since we have no nib files")
  }
  
  /// Called when the controller's view is loaded into memory
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor.systemGray
    
    self.setupSubviews()
    self.setupConstraints()
  }
}
