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
    var viewModel: TableViewModel!

    init(window: UIWindow?) {
        self.window = window
    }

    func toDetail(user: CellUserModel) {
        let controller = DetailCoordinator(window: window, cellUser: user)
        childCoordinators.append(controller)
        controller.parentCoordinator = self
        controller.start()
    }
}

extension TableCoordinator: HaveFilterCoordinator {
    func showFilter() {
        let controller = FilterCoordinator(window: window)
        childCoordinators.append(controller)
        controller.parentCoordinator = self
        controller.start()
    }

    func filterDidFinish(with key: String?) {
        viewModel.setFilter(key: key)
    }
}

extension TableCoordinator: CoordinatorWithInternetCheck {
    func startInternetON() {
        viewModel = TableViewModel(coordinator: self)
        viewController = TableViewController.instantiate(name: "Table")
        viewController?.viewModel = viewModel
        if let viewController = viewController {
            window.rootUINavigationController()?.pushViewController(viewController, animated: true)
        }
    }
}
