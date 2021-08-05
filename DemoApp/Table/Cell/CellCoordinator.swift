//
//  CellCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class CellC: Coordinator {
    var viewController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    required init(_ viewController: UINavigationController?) {
        self.viewController = viewController
    }

    func start() {
        let vc = CellVC()
        let vm = CellVM()
        vc.coordinator = self
        vc.viewModel = vm
        viewController?.pushViewController(vc, animated: true)
    }
}
