//
//  Scene.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// The navigation scene
enum Scene {
  
  // MARK: - Cases
  
  /// The main navigation scene
  case main
  
  /// The login screen
  case login
  
  /// Page 1
  case master
  
  /// Page 2
  case detail
  
  // MARK: - Methods
  
  /// Factory method to create the view controller for the scene
  ///
  /// - Parameter parentController: The main navigation controller
  ///
  /// - Returns: The associated view controller
  func createViewController<T: ViewController>(parentController: MainViewController?) -> T {
    switch self {
    case .main:
      return T(
        presenter: MainPresenter(
          interactor: MainInteractor(
            router: MainRouter(parentController: nil)
          )
        )
      )
    case .login:
      return T(
        presenter: LoginPresenter(
          interactor: LoginInteractor(
            router: LoginRouter(parentController: parentController)
          )
        )
      )
    case .master:
      return T(
        presenter: MasterPresenter(
          interactor: MasterInteractor(
            router: MasterRouter(parentController: parentController)
          )
        )
      )
    case .detail:
      return T(
        presenter: DetailPresenter(
          interactor: DetailInteractor(
            router: DetailRouter(parentController: parentController)
          )
        )
      )
    }
  }
  
}
