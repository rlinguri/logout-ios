//
//  MainPresenter.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// Main module view model
class MainPresenter: Presenter {
  
  // MARK: - Properties
  
  /// The main module's interactor
  var interactor: Interactor
  
  /// The main module's view controller
  weak var viewController: ViewController?
  
  // MARK: - Presenter
  
  /// Required initializer
  ///
  /// - Parameter interactor: The main module's interactor
  required init(interactor: Interactor) {
    self.interactor = interactor
    self.interactor.presenter = self
  }
}
