//
//  UIWindowExtension.swift
//  DemoApp
//
//  Created by Simon Sestak on 06/08/2021.
//

import UIKit

extension Optional where Wrapped == UIWindow {
    func rootUINavigationController() -> UINavigationController? {
        guard let window = self else {
            return nil
        }
        guard let rooViewController = window.rootViewController as? UINavigationController else {
            return nil
        }
        return rooViewController
    }
}
