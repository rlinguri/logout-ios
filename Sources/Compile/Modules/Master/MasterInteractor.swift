//
//  MasterInteractor.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

class MasterInteractor: Interactor {
  
  // MARK: - Properties
  
  /// The master module's router
  var router: Router
  
  /// The master module's view model
  weak var presenter: Presenter?
  
  // MARK: - Interactor
  
  /// Required initializer
  ///
  /// - Parameter router: The master module's router
  required init(router: Router) {
    self.router = router
    self.router.interactor = self
  }
  
}
