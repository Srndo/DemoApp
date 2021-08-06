//
//  AppCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class AppCoordinator: Coordinator {
    var window: UIWindow?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    required init(_ window: UIWindow?) {
        self.window = window

    }

    func start() {
        let navigationViewController = UINavigationController()

        window?.rootViewController = navigationViewController

        let mainCoordinator = MainCoordinator(window: window)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }

}
