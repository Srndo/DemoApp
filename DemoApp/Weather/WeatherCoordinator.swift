//
//  WeatherCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class WeatherC: Coordinator {
    var viewController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    required init(_ viewController: UINavigationController?) {
        self.viewController = viewController
    }

    func start() {
        let vc = WeatherVC()
        vc.coordinator = self
        vc.viewModel = WeatherVM()
        viewController?.pushViewController(vc, animated: true)
    }
}
