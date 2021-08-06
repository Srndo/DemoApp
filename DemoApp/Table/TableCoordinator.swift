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
        let vc = TableViewController(viewModel: viewModel)
        (window?.rootViewController as? UINavigationController)?.pushViewController(vc, animated: true)
    }

    func toDetail(id userID: Int) {
        let controller = DetailCoordinator(window: window)
        childCoordinators.append(controller)
        controller.userID = userID
        controller.parentCoordinator = self
        controller.start()
    }
}
