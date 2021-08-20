//
//  TableCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableCoordinator: Coordinator {
    var viewController: TableViewController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    func start() {
        viewController = TableViewController.instantiate(name: "Table")
        viewController?.viewModel = TableViewModel(coordinator: self)
        // swiftlint:disable:next line_length
        viewController?.tabBarItem = UITabBarItem(title: "table", image: UIImage(systemName: "table"), selectedImage: UIImage(systemName: "table.fill"))
    }

    func toDetail(user: CellUserModel) {
        guard let navigationController = viewController?.navigationController else { return }
        let controller = DetailCoordinator(navigationController: navigationController, cellUser: user)
        childCoordinators.append(controller)
        controller.parentCoordinator = self
        controller.start()
    }
}
