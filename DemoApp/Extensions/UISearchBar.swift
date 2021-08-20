//
//  UISearchBar.swift
//  DemoApp
//
//  Created by Simon Sestak on 20/08/2021.
//

import UIKit

extension UISearchBar {
    func setBackground(color: UIColor) {
        self.backgroundImage = UIImage()
        self.backgroundColor = color
        self.barTintColor = color
    }
}
