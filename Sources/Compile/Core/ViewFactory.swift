//
//  ViewFactory.swift
//  logout
//
//  Created by Roderic Linguri on 5/30/21.
//

import UIKit

/// Factory methods for creating pre-configured views
struct ViewFactory {
  
  /// Creates a configured button
  ///
  /// - Returns: a `UIButton` instance
  static func createButton() -> UIButton {
    let view = UIButton()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor.systemBlue
    view.layer.cornerRadius = 6.0
    view.layer.borderWidth = 0.5
    view.layer.borderColor = UIColor.darkGray.cgColor
    view.setTitleColor(UIColor.white, for: .normal)
    return view
  }
  
  /// Creates a configured label
  ///
  /// - Returns: a `UILabel` instance
  static func createLabel() -> UILabel {
    let view = UILabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.font = UIFont.preferredFont(forTextStyle: .title2)
    view.textColor = UIColor.darkText
    view.textAlignment = .center
    return view
  }
  
}
