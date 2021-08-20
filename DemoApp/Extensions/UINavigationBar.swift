//
//  UINavigationController.swift
//  DemoApp
//
//  Created by Simon Sestak on 20/08/2021.
//

import UIKit

extension UINavigationBar {
    func makeRounded(cornerRadius: CGFloat = 20.0) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.layer.isOpaque = true
    }
}
