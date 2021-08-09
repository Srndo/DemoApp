//
//  WeatherViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class WeatherViewModel {

    let coordinator: WeatherCoordinator

    init(coordinator: WeatherCoordinator) {
        self.coordinator = coordinator
    }

    let backgroundImage = UIImage(named: "landscape")
}
