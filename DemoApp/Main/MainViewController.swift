//
//  MainViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class MainVC: UIViewController, Coordinating {
    var coordinator: Coordinator?

    lazy var button: MyButton = {
        let button = MyButton(title: "To Weather")
        button.center(to: view.center, 0, -30)
        button.addTarget(self, action: #selector(toWeather), for: .touchUpInside)
        return button
    }()

    lazy var button2: MyButton = {
       let button = MyButton(title: "To Table")
        button.center(to: view.center, 0, 30)
        button.addTarget(self, action: #selector(toTable), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        view.addSubview(button)
        view.addSubview(button2)
    }

    @objc func toWeather() {
        guard let coordinator = coordinator as? MainC else { return }
        coordinator.toWeather()
    }

    @objc func toTable() {
        guard let coordinator = coordinator as? MainC else { return }
        coordinator.toTable()
    }
}
