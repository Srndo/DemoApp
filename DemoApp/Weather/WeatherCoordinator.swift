//
//  WeatherCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class WeatherCoordinator: Coordinator {
    var window: UIWindow?
    var viewController: WeatherViewController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        viewController = WeatherViewController.instantiate(name: "Weather")
        viewController?.viewModel = WeatherViewModel(coordinator: self)
        if  let viewController = viewController {
            window.rootUINavigationController()?.pushViewController(viewController, animated: true)
        }
    }
}
