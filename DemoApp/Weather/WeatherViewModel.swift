//
//  WeatherViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit
import PromiseKit

private let errorColor = UIColor(red: 0.96, green: 0.667, blue: 0.690, alpha: 1)

class WeatherViewModel: BaseViewModel {
    enum LabelNames: String {
        case first = "temp"
        case second = "place"
        case third = "condition"
    }

    let coordinator: WeatherCoordinator
    let weatherHelper = WeatherHelper()
    let locationHelper = LocationHelper()
    override var title: String { "Weather" }
    override var navButtonType: UIBarButtonItem.SystemItem? { .refresh }

    var labelText: Observable<[LabelNames: String]> = Observable([:])
    var thirdLabelColor: Observable<UIColor> = Observable(UIColor.black)
    var iconImage: Observable<UIImage?> = Observable(nil)

    init(coordinator: WeatherCoordinator) {
        self.coordinator = coordinator
        super.init()
        updateWithCurrentLocation()
    }

    let backgroundImage = UIImage(named: "landscape")

    override func navButtonTapped() {
        updateWithCurrentLocation()
    }
}

extension WeatherViewModel: WeatherLocationController {
    func updateWithCurrentLocation() {
        locationHelper.getLocation()
            .done { [weak self] placemark in
                self?.handleLocation(placemark: placemark)
            }
            .catch { [weak self] error in
                guard let self = self else { return }
                self.labelText.value[.first] = "---"
                self.labelText.value[.second] = "---"

                switch error {
                case is CLError where (error as? CLError)?.code == .denied:
                    self.labelText.value[.third] = "Enable Location Permissions in Settings"
                    self.thirdLabelColor.value = UIColor.white
                default:
                    self.labelText.value[.third] = error.localizedDescription
                    self.thirdLabelColor.value = errorColor
                }
            }
    }

    func handleLocation(placemark: CLPlacemark) {
        handleLocation( city: placemark.locality,
                       state: placemark.administrativeArea,
                       coordinate: placemark.location!.coordinate)
    }

    func handleLocation( city: String?,
                                state: String?,                             // swiftlint:disable:this vertical_parameter_alignment line_length
                                coordinate: CLLocationCoordinate2D) {        // swiftlint:disable:this vertical_parameter_alignment line_length
        if let city = city, let state = state {
            self.labelText.value[.first] = "\(city), \(state)"
        }

        weatherHelper.getWeather(atLatitude: coordinate.latitude, longitude: coordinate.longitude)
          .then { [weak self] weather -> Promise<UIImage> in
            guard let self = self else { return brokenPromise() }

            self.labelText.value[.second] = "\(weather.main.temp.rounded())ºC"
            self.labelText.value[.third] = weather.weather.first?.description

            return self.weatherHelper.getIcon(named: weather.weather.first!.icon)
          }
          .done(on: DispatchQueue.main) { icon in
            self.iconImage.value = icon
          }
          .catch { error in
            self.labelText.value[.second] = "--"
            self.labelText.value[.third] = error.localizedDescription
            self.thirdLabelColor.value = errorColor
          }
    }
}
