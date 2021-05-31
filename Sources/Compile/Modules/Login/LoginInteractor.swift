//
//  LoginInteractor.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// Login module network and storage tasks
class LoginInteractor: Interactor {
  
  // MARK: - Properties
  
  /// The login module's router
  var router: Router
  
  /// The login module's view model
  weak var presenter: Presenter?
  
  // MARK: - Interactor
  
  /// Required initializer
  ///
  /// - Parameter router: The login module's router
  required init(router: Router) {
    self.router = router
    self.router.interactor = self
  }
  
}
