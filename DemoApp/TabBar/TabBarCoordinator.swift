//
//  MainCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

 class TabBarCoordinator: Coordinator {
    let window: UIWindow?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        // set default TabBar
        guard let viewController = window.rootTabBarController() else {
            fatalError("Root tabBar is nil")
        }

        // create coordinators for each TabBarItem
        let weatherCoordinator = WeatherCoordinator()
        let tableCoordinator = TableCoordinator()

        // temp variable
        var navigationControllers = [UIViewController]()

        // create instance of viewController for TabBarItem
        tableCoordinator.start()
        if let tableViewController = tableCoordinator.viewController {
            // embed viewController in NavigationController
            // this is needed if we going to create a hierarchy in TabBarItemView
            let navigationController = UINavigationController(rootViewController: tableViewController)
            navigationController.navigationBar.makeRounded()
            navigationControllers.append(navigationController)
        }

        // create instance of viewController for TabBarItem
        weatherCoordinator.start()
        if let weatherViewController = weatherCoordinator.viewController {
            // embed viewController in NavigationController
            // this is needed if we going to create a hierarchy in TabBarItemView
            let navigationController = UINavigationController(rootViewController: weatherViewController)
            navigationController.navigationBar.makeRounded()
            navigationControllers.append(navigationController)
        }

        // set all viewControllers into tabBar, each will be visible as tabBarItem
        viewController.viewControllers = navigationControllers
    }
 }
