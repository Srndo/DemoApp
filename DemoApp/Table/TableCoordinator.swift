//
//  TableCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableC: Coordinator {
    var viewController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    required init(_ viewController: UINavigationController?) {
        self.viewController = viewController
    }

    func start() {
        let vc = TableVC()
        let viewModel = TableVM()
        vc.viewModel = viewModel
        vc.coordinator = self
        viewController?.pushViewController(vc, animated: true)
    }

    func toDetail() {
        let controller = CellC(viewController)
        childCoordinators.append(controller)
        controller.parentCoordinator = self
        controller.start()
    }
}
