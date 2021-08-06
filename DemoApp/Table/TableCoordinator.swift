//
//  TableCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableCoordinator: Coordinator {
    var window: UIWindow?
    var viewController: TableViewController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        let viewModel = TableViewModel(coordinator: self)
        viewController = TableViewController(viewModel: viewModel)
        if let viewController = viewController {
            window.rootUINavigationController()?.pushViewController(viewController, animated: false)
        }
    }

    func toDetail(user: CellUserModel) {
        let controller = DetailCoordinator(window: window, cellUser: user)
        childCoordinators.append(controller)
        controller.parentCoordinator = self
        controller.start()
    }
}
