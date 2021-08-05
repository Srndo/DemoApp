//
//  MainCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class MainC: Coordinator {
    var viewController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    required init(_ viewController: UINavigationController?) {
        self.viewController = viewController
    }

    func start() {
        var vc: UIViewController & Coordinating = MainVC()
        vc.coordinator = self
        viewController?.setViewControllers([vc], animated: false)
    }

    func toWeather() {
        let coordinator = WeatherC(viewController)
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }

    func toTable() {
        let coordinator = TableC(viewController)
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
}
