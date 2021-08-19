//
//  MainViewModel.swift
//  DemoApp
//
//  Created by David Cvrcek on 05.08.2021.
//

import UIKit

class MainViewModel: BaseViewModel {

    var coordinator: MainCoordinator!
    override var title: String { "Main" }

    var titleButton1: String = "To Weather"
    var titleButton2: String = "To Table"
    let tabBarItems: [UITabBarItem]

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        self.tabBarItems = [
            UITabBarItem(title: "Table", image: UIImage(systemName: "tablecells"), tag: 0),
            UITabBarItem(title: "Weather", image: UIImage(systemName: "thermometer"), tag: 1)
        ]
    }

    func button1Tapped() {
        coordinator.toWeather()
    }

    func button2Tapped() {
        coordinator.toTable()
    }
}
