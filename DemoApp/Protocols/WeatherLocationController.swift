//
//  WeatherLocationController.swift
//  DemoApp
//
//  Created by Simon Sestak on 12/08/2021.
//

import PromiseKit

protocol WeatherLocationController {
    func updateWithCurrentLocation()
    func handleLocation(placemark: CLPlacemark)
    func handleLocation( city: String?, state: String?, coordinate: CLLocationCoordinate2D)
}
