//
//  Coordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit
import Foundation

protocol Coordinator: AnyObject {
    var viewController: UINavigationController? { get set }
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    init(_ viewController: UINavigationController?)

    func start()
}

extension Coordinator {
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }

    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
