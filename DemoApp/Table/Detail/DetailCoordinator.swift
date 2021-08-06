//
//  CellCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailCoordinator: Coordinator {
    var window: UIWindow?
    var viewController: DetailViewController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var userID: Int = -1

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let viewModel = DetailViewModel(coordinator: self, userID: userID)
        viewController = DetailViewController(viewModel)
        if let viewController = viewController {
            window.rootUINavigationController()?.pushViewController(viewController, animated: true)
        }
    }
}
