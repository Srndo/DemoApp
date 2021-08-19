//
//  UIWindowExtension.swift
//  DemoApp
//
//  Created by Simon Sestak on 06/08/2021.
//

import UIKit

extension Optional where Wrapped == UIWindow {
    private func rootViewController() -> UIViewController? {
        guard let window = self else {
            return nil
        }
        return  window.rootViewController
    }

    func rootUINavigationController() -> UINavigationController? {
        guard let rootNavigationViewController = rootViewController() as? UINavigationController else {
            return nil
        }
        return rootNavigationViewController
    }

    func rootTabBarController() -> UITabBarController? {
        guard let rootTabBarController = rootViewController() as? UITabBarController else {
            return nil
        }
        return rootTabBarController
    }
}
