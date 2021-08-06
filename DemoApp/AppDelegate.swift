//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    // swiftlint:disable:next line_length
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        let coordinator = AppCoordinator(window)
        coordinator.start()
        window?.makeKeyAndVisible()
        return true
    }

}
