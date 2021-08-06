//
//  MainCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class MainCoordinator: Coordinator {
    var window: UIWindow?
    var viewController: MainViewController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    required init(window: UIWindow?) {
        self.window = window
    }

    func start() {

        let viewModel = MainViewModel(coordinator: self)
        viewController = MainViewController(viewModel: viewModel)
        if let viewController = viewController {
            let nvc = (window?.rootViewController as? UINavigationController)
            nvc?.setViewControllers([viewController], animated: false)
        }
    }

    func toWeather() {
        let coordinator = WeatherCoordinator(window: self.window)
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }

    func toTable() {
        let coordinator = TableCoordinator(window: self.window)
        childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.start()
    }
}
