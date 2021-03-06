//
//  MasterRouter.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// Master module navigation event routing
class MasterRouter: Router {
  
  // MARK: - Properties
  
  /// The parent module's view controller
  weak var parent: ViewController?
  
  /// The master module's interactor
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
