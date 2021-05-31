//
//  Event.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import Foundation

/// Enumeration of events that can occur in the app
enum Event {
  
  /// A default event
  case none
  
  /// User tapped Log Out
  case didTapLogout
  
  /// User tapped Page 2
  case didTapDetail
  
  /// User tapped Back from Page 2
  case didTapMaster
  
  /// User tapped Login
  case didTapLogin
  
}
