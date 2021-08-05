//
//  CellCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailC: Coordinator {
    var viewController: UINavigationController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var userID: Int = -1

    required init(_ viewController: UINavigationController?) {
        self.viewController = viewController
    }

    func start() {
        let vm = DetailVM(userID: userID)
        let vc = DetailVC(vm)
        vc.coordinator = self
        viewController?.pushViewController(vc, animated: true)
    }
}
