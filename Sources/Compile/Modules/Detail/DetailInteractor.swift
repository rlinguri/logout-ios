//
//  DetailInteractor.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

class DetailInteractor: Interactor {
  
  // MARK: - Properties
  
  /// The detail module's router
  var router: Router
  
  /// The detail module's view model
  weak var presenter: Presenter?
  
  // MARK: - Interactor
  
  /// Required initializer
  ///
  /// - Parameter router: The detail module's router
  required init(router: Router) {
    self.router = router
    self.router.interactor = self
  }
  
}
