//
//  App.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// App Entity
struct App: Entity {
  
  // MARK: - Properties
  
  /// The current state of the app
  var state: State = .loading
  
  /// The scene sending the event
  var scene: Scene = .master
  
  /// The event being sent
  var event: Event = .none
  
}
