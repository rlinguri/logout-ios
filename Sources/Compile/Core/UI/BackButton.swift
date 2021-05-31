//
//  BackButton.swift
//  logout
//
//  Created by Roderic Linguri on 5/31/21.
//

import UIKit

/// A Precomposed Back Button
class BackButton: UIButton {
  
  /// Lays out subviews.
  override func layoutSubviews() {
    super.layoutSubviews()
    
    // Based on total width of 108 pt and a height of 36 pt
    self.imageEdgeInsets = UIEdgeInsets(top: 6.0, left: 12.0, bottom: 6.0, right: 60.0)
    self.titleEdgeInsets = UIEdgeInsets(top: 6.0, left: -6.0, bottom: 6.0, right: 12.0)
    self.layer.cornerRadius = 6.0
    self.layer.borderWidth = 0.5
    self.layer.borderColor = UIColor.darkGray.cgColor
    self.backgroundColor = UIColor.systemBlue
    self.tintColor = UIColor.white
  }
  
  /// Initialize without passing in the frame, which must be 108 x 36
  init() {
    super.init(frame: CGRect(x: 0, y: 0, width: 108, height: 36))
    self.layoutSubviews()
    self.setImage(UIImage(named: "nav-back"), for: .normal)
    self.setTitle("Back", for: .normal)
  }
  
  /// Required initializer (not implemented)
  ///
  /// - Parameter coder: An instance of `NSCoder`
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
