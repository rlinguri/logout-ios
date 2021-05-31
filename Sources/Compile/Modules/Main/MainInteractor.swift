//
//  MainInteractor.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// Main module network and storage tasks
class MainInteractor: Interactor {
  
  // MARK: - Properties
  
  /// The main module's router
  var router: Router
  
  /// The main module's view model
  weak var presenter: Presenter?
  
  // MARK: - Interactor
  
  /// Required initializer
  ///
  /// - Parameter router: The main module's router
  required init(router: Router) {
    self.router = router
    self.router.interactor = self
  }
}
