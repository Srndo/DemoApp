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
    var user: CellUserModel

    init(window: UIWindow?, cellUser: CellUserModel) {
        self.window = window
        self.user = cellUser
    }
}

extension DetailCoordinator: CoordinatorWithInternetCheck {
    func startInternetON() {
        viewController = DetailViewController.instantiate(name: "Detail")
        viewController?.viewModel = DetailViewModel(coordinator: self, user: user)
        if let viewController = viewController {
            window.rootUINavigationController()?.pushViewController(viewController, animated: true)
        }
    }
}
