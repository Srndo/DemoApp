//
//  CellViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class CellVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var viewModel: CellVM!

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let coordinator = coordinator as? CellC else { return }
        coordinator.didFinish()
    }
}
