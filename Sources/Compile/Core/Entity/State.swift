//
//  State.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// App State
enum State {
  
  // MARK: - Cases
  
  /// The app is in a loading state
  case loading
  
  /// The user is authenticated
  case unauthenticated
  
  /// The user is not authenticated
  case authenticated
  
}
