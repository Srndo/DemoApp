//
//  MainViewModel.swift
//  DemoApp
//
//  Created by David Cvrcek on 05.08.2021.
//

import Foundation

class MainViewModel {

    var coordinator: MainCoordinator!
    var viewTitle: String = "Main"
    
    var titleButton1: String = "To Weather"
    var titleButton2: String = "To Table"

    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }

    func button1Tapped() {
        coordinator.toWeather()
    }

    func button2Tapped() {
        coordinator.toTable()
    }
}
