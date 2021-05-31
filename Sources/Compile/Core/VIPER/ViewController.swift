//
//  ViewController.swift
//  logout
//
//  Created by Roderic Linguri on 5/29/21.
//

import UIKit

/// VIPER View Protocol
protocol ViewController: UIViewController {
  
  // MARK: - Required Properties
  
  /// Strong reference to the current module's view model
  var presenter: Presenter { get set }
  
  /// The child modules' routers
  var childRouters: [Router]? { get set }
  
  /// Initialize the view controller with a presenter
  ///
  /// - Parameter presenter: the module's presenter
  init(presenter: Presenter)
  
  /// Receive notification from presenter
  ///
  /// - Parameter entity: the `Entity` instance
  func notify(entity: Entity)
  
  /// Receive notification from a child router
  ///
  /// - Parameter entity: the `Entity` instance
  func post(entity: Entity)
  
  /// Add the child module's router for passing notifications
  ///
  /// - Parameter child: The child module's router
  func addChildRouter(child: Router)
  
}

extension ViewController {
  
  /// ViewController's default post implementation
  ///
  /// Override this method to access entity coming from child module's router
  /// before it is forwarded to the current module's presenter
  ///
  /// - Parameter entity: the `Entity` instance
  func post(entity: Entity) {
    self.presenter.post(entity: entity)
  }
  
  /// ViewController's default notify implementation
  ///
  /// Override this method to access entity coming from the current module's
  /// presenter before it is passed down to the child module's router
  ///
  /// - Parameter entity: the `Entity` instance
  func notify(entity: Entity) {
    if let children = self.childRouters {
      for router in children {
        router.notify(entity: entity)
      }
    }
  }
  
  /// Add the child module's router for passing notifications
  ///
  /// - Parameter child: The child module's router
  func addChildRouter(child: Router) {
    if self.childRouters == nil {
      self.childRouters = Array<Router>()
    }
    self.childRouters!.append(child)
  }
  
}
