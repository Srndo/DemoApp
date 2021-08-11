//
//  FilterCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

class FilterCoordinator: Coordinator {
    var window: UIWindow?
    var viewController: FilterViewController?
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?

    init(window: UIWindow?) {
        self.window = window
    }

    func start() {
        viewController = FilterViewController.instantiate(name: "Filter")
        viewController?.viewModel = FilterViewModel(coordinator: self)
        if let viewController = viewController {
            window.rootUINavigationController()?.present(viewController, animated: true)
        }
    }

    func setFilter(with key: String?) {
        viewController?.dismiss(animated: true) {
            guard let tableCoordinator = self.parentCoordinator as? HaveFilterCoordinator else { return }
            tableCoordinator.filterDidFinish(with: key)
        }
    }
}
