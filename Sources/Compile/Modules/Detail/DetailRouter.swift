//
//  DetailRouter.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

class DetailRouter: Router {
  
  // MARK: - Properties
  
  /// The parent module's view controller
  weak var parent: ViewController?
  
  /// The detail module's interactor
  weak var interactor: Interactor?
  
  // MARK: - Router
  
  /// Required initializer
  ///
  /// - Parameter parentController: The parent module's view controller
  required init(parentController: ViewController?) {
    self.parent = parentController
    self.parent?.addChildRouter(child: self)
  }

}
