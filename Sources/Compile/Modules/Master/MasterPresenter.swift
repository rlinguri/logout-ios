//
//  MasterPresenter.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

class MasterPresenter: Presenter {
  
  // MARK: - Properties
  
  /// The master module's interactor
  var interactor: Interactor
  
  /// The master module's view controller
  weak var viewController: ViewController?
  
  // MARK: - Presenter
  
  /// Required initializer
  ///
  /// - Parameter interactor: The master module's interactor
  required init(interactor: Interactor) {
    self.interactor = interactor
    self.interactor.presenter = self
  }
  
}
