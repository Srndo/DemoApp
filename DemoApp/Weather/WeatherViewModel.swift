//
//  WeatherViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit
import PromiseKit

private let appID = "3378aaf40a3bca178a4272ce250385b2"
private let errorColor = UIColor(red: 0.96, green: 0.667, blue: 0.690, alpha: 1)

class WeatherViewModel {
    enum LabelNames: String {
        case first = "temp"
        case second = "place"
        case third = "condition"
    }

    let coordinator: WeatherCoordinator
    let weatherHelper = WeatherHelper()
    let locationHelper = LocationHelper()
    let title = "Weather"

    var labelText: [LabelNames: String] = [:]
    var thirdLabelColor: UIColor = UIColor.white
    var iconImage: UIImage?

    init(coordinator: WeatherCoordinator) {
        self.coordinator = coordinator
    }

    let backgroundImage = UIImage(named: "landscape")

    func updateWithCurrentLocation(completition: @escaping () -> Void) {
        locationHelper.getLocation()
            .done { [weak self] placemark in
                self?.handleLocation(placemark: placemark, completition: completition)
                completition()
            }
            .catch { [weak self] error in
                guard let self = self else { return }
                self.labelText[.first] = "---"
                self.labelText[.second] = "---"

                switch error {
                case is CLError where (error as? CLError)?.code == .denied:
                    self.labelText[.third] = "Enable Location Permissions in Settings"
                    self.thirdLabelColor = UIColor.white
                default:
                    self.labelText[.third] = error.localizedDescription
                    self.thirdLabelColor = errorColor
                }
                completition()
            }
    }

    private func handleLocation(placemark: CLPlacemark, completition: @escaping () -> Void) {
        // swiftlint:disable:next line_length
        handleLocation(city: placemark.locality, state: placemark.administrativeArea, coordinate: placemark.location!.coordinate, completition: completition)
    }

    // swiftlint:disable:next line_length
    private func handleLocation(city: String?, state: String?, coordinate: CLLocationCoordinate2D, completition: @escaping () -> Void) {
        if let city = city, let state = state {
            self.labelText[.first] = "\(city), \(state)"
        }

        weatherHelper.getWeather(atLatitude: coordinate.latitude, longitude: coordinate.longitude)
          .then { [weak self] weather -> Promise<UIImage> in
            guard let self = self else { return brokenPromise() }

            self.labelText[.second] = "\(weather.main.temp.rounded())ºC"
            self.labelText[.third] = weather.weather.first?.description
            completition()
            return self.weatherHelper.getIcon(named: weather.weather.first!.icon)
          }
          .done(on: DispatchQueue.main) { icon in
            self.iconImage = icon
            completition()
          }
          .catch { error in
            self.labelText[.second] = "--"
            self.labelText[.third] = error.localizedDescription
            self.thirdLabelColor = errorColor
            completition()
          }
    }
}
