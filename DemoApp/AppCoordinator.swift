//
//  AppCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class AppCoordinator: Coordinator {
    var viewController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    required init(_ viewController: UINavigationController?) {
        self.viewController = viewController
    }

    func start() {
        let mainCoordinator = MainC(viewController)
        childCoordinators.append(mainCoordinator)
        mainCoordinator.start()
    }

}
