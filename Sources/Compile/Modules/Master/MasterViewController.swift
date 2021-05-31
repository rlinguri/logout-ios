//
//  MasterViewController.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// Master module view controller
class MasterViewController: UIViewController, ViewController {
  
  // MARK: - Properties
  
  /// The master module's view model
  var presenter: Presenter
  
  /// An array of child module routers
  var childRouters: [Router]?
  
  // MARK: - Outlets / Subviews
  
  /// The label to indicate which page is being displayed
  let titleLabel: UILabel = ViewFactory.createLabel()
  
  /// The bright, shiny candy-like button for logging out
  let logoutButton: UIButton = ViewFactory.createButton()
  
  /// The bright, shiny candy-like button for transitioning to the detail view
  let detailButton: UIButton = ViewFactory.createButton()
  
  // MARK: - Actions / Selectors
  
  /// Log Out button action
  ///
  /// - Parameter sender: the button
  @objc func didTapLogout(_ sender: UIButton) {
    sender.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
    // If modalPresentationStyle == .fullScreen, this will dim the screen for the modal
    // self.view.backgroundColor = UIColor.systemGray.withAlphaComponent(0.9)
    let entity = App(state: .unauthenticated, scene: .master, event: .didTapLogout)
    self.presenter.post(entity: entity)
  }
  
  /// Detail button action
  ///
  /// - Parameter sender: the button
  @objc func didTapDetail(_ sender: UIButton) {
    sender.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
    let entity = App(state: .authenticated, scene: .master, event: .didTapDetail)
    self.presenter.post(entity: entity)
  }
  
  // MARK: - MasterViewController
  
  /// Configure subviews and add to view hierarchy
  private func setupSubviews() {
    self.titleLabel.text = "Page 1"
    
    self.view.addSubview(self.titleLabel)
    
    self.logoutButton.addTarget(
      self,
      action: #selector(MasterViewController.didTapLogout(_:)),
      for: .touchUpInside
    )
    
    self.logoutButton.setTitle("Logout", for: .normal)
    
    self.view.addSubview(self.logoutButton)
    
    self.detailButton.addTarget(
      self,
      action: #selector(MasterViewController.didTapDetail(_:)),
      for: .touchUpInside
    )
    
    self.detailButton.setTitle("Go to Page 2", for: .normal)
    
    self.view.addSubview(self.detailButton)
  }
  
  /// Add and activate Autolayout constraints
  private func setupConstraints() {
    self.logoutButton.topAnchor.constraint(
      equalTo: self.view.safeAreaLayoutGuide.topAnchor,
      constant: 17.0
    ).isActive = true
    
    self.logoutButton.trailingAnchor.constraint(
      equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
      constant: -17.0
    ).isActive = true
    
    self.logoutButton.widthAnchor.constraint(equalToConstant: 108).isActive = true
    self.logoutButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    self.detailButton.centerXAnchor.constraint(
      equalTo: self.view.centerXAnchor
    ).isActive = true
    
    self.detailButton.centerYAnchor.constraint(
      equalTo: self.view.centerYAnchor
    ).isActive = true
    
    self.detailButton.widthAnchor.constraint(equalToConstant: 162).isActive = true
    self.detailButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
    self.titleLabel.leadingAnchor.constraint(
      equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
      constant: 17.0
    ).isActive = true
    
    self.titleLabel.trailingAnchor.constraint(
      equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
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
  
  /// Receive notification from presenter when data is updated (could be on background)
  ///
  /// - Parameter entity: The App entity
  func notify(entity: Entity) {
    OperationQueue.main.addOperation {
      self.logoutButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(1.0)
      self.detailButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(1.0)
    }
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
    
    self.setupSubviews()
    self.setupConstraints()
  }

  /// Called when the view is about to be added to a view hierarchy
  ///
  /// - Parameter animated: whether or not the transition will be animated
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.view.backgroundColor = UIColor.systemGray.withAlphaComponent(1.0)
  }

}
