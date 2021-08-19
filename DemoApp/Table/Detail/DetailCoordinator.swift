//
//  CellCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var viewController: DetailViewController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var user: CellUserModel

    init(navigationController: UINavigationController?, cellUser: CellUserModel) {
        self.navigationController = navigationController
        self.user = cellUser
    }

    func start() {
        viewController = DetailViewController.instantiate(name: "Detail")
        viewController?.viewModel = DetailViewModel(coordinator: self, user: user)
        if let viewController = viewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
