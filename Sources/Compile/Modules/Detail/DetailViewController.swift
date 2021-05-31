//
//  DetailViewController.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// Detail module view controller
class DetailViewController: UIViewController, ViewController {
  
  // MARK: - Properties
  
  /// The detail module's view model
  var presenter: Presenter
  
  /// An array of child module routers
  var childRouters: [Router]?
  
  // MARK: - Outlets / Subviews
  
  /// The label to indicate which page is being displayed
  let titleLabel: UILabel = ViewFactory.createLabel()
  
  /// The bright, shiny candy-like button for logging out
  let logoutButton: UIButton = ViewFactory.createButton()
  
  /// The bright, shiny candy-like button for unwinding to master
  let backButton: BackButton = {
    let view = BackButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: - Actions / Selectors
  
  /// Log Out button action
  ///
  /// - Parameter sender: the button
  @objc func didTapLogout(_ sender: UIButton) {
    sender.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
    // If modalPresentationStyle == .fullScreen, this will dim the screen for the modal
    // self.view.backgroundColor = UIColor.systemGray.withAlphaComponent(0.9)
    let entity = App(state: .unauthenticated, scene: .detail, event: .didTapLogout)
    self.presenter.post(entity: entity)
  }
  
  /// Back button action
  ///
  /// - Parameter sender: the button
  @objc func didTapBack(_ sender: UIButton) {
    sender.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
    let entity = App(state: .authenticated, scene: .detail, event: .didTapMaster)
    self.presenter.post(entity: entity)
  }
  
  // MARK: - DetailViewController
  
  /// Configure subviews and add to view hierarchy
  private func setupSubviews() {
    self.titleLabel.text = "Page 2"
    
    self.view.addSubview(self.titleLabel)
    
    self.logoutButton.addTarget(
      self,
      action: #selector(DetailViewController.didTapLogout(_:)),
      for: .touchUpInside
    )
    
    self.logoutButton.setTitle("Log Out", for: .normal)
    
    self.view.addSubview(self.logoutButton)
    
    self.backButton.addTarget(
      self,
      action: #selector(DetailViewController.didTapBack(_:)),
      for: .touchUpInside
    )
        
    self.view.addSubview(self.backButton)
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
    
    self.backButton.topAnchor.constraint(
      equalTo: self.view.safeAreaLayoutGuide.topAnchor,
      constant: 17.0
    ).isActive = true
    
    self.backButton.leadingAnchor.constraint(
      equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
      constant: 17.0
    ).isActive = true
    
    self.backButton.widthAnchor.constraint(equalToConstant: 108).isActive = true
    self.backButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
    
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
      self.backButton.backgroundColor = UIColor.systemBlue.withAlphaComponent(1.0)
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
