//
//  CellViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var viewModel: DetailVM!

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard let coordinator = coordinator as? DetailC else { return }
        coordinator.didFinish()
    }
}
