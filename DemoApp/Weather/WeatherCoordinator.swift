//
//  WeatherCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class WeatherCoordinator: Coordinator {
    var viewController: WeatherViewController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    func start() {
        viewController = WeatherViewController.instantiate(name: "Weather")
        viewController?.viewModel = WeatherViewModel(coordinator: self)
        // swiftlint:disable:next line_length
        viewController?.tabBarItem = UITabBarItem(title: "Weather", image: UIImage(systemName: "thermometer.sun"), selectedImage: UIImage(systemName: "thermometer.sun.fill"))
    }
}
