//
//  TableViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var viewModel: TableVM!

    lazy var button: Button = {
        let button = Button(title: "To detail")
        button.center(to: view.center, 0, -30)
        button.addTarget(self, action: #selector(toDetail), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        view.backgroundColor = .systemBackground
        view.addSubview(button)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinish()
    }

    @objc func toDetail() {
        guard let coordinator = coordinator as? TableC else { return }
        coordinator.toDetail()
    }
}
