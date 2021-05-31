//
//  DetailPresenter.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

class DetailPresenter: Presenter {
  
  // MARK: - Properties
  
  /// The detail module's interactor
  var interactor: Interactor
  
  /// The detail module's view controller
  weak var viewController: ViewController?
  
  // MARK: - Presenter
  
  /// Required initializer
  ///
  /// - Parameter interactor: The detail module's interactor
  required init(interactor: Interactor) {
    self.interactor = interactor
    self.interactor.presenter = self
  }
  
}
