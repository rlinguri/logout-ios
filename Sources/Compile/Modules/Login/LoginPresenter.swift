//
//  LoginPresenter.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// Login module view model
class LoginPresenter: Presenter {
  
  // MARK: - Properties
  
  /// The login module's interactor
  var interactor: Interactor
  
  /// The login module's view controller
  weak var viewController: ViewController?
  
  // MARK: - Presenter
  
  /// Required initializer
  ///
  /// - Parameter interactor: The login module's interactor
  required init(interactor: Interactor) {
    self.interactor = interactor
    self.interactor.presenter = self
  }
  
}
