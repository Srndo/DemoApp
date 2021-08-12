//
//  NotInternetConnectionCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 12/08/2021.
//

import UIKit

class NotInternetConnectionCoordinator: Coordinator {
    var window: UIWindow?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var viewController: NotInternetConnectionViewController?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        viewController = NotInternetConnectionViewController.instantiate(name: "NotInternetConnection")
        viewController?.viewModel = NotInternetConnectionViewModel(coordinator: self)
        if let viewController = viewController {
            window.rootUINavigationController()?.pushViewController(viewController, animated: true)
        }
    }
}
