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
        let viewModel = WeatherViewModel()
        viewController = WeatherViewController(viewModel: viewModel)
        if  let viewController = viewController {
            (window?.rootViewController as? UINavigationController)?.pushViewController(viewController, animated: true)
        }
    }
}
