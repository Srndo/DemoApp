//
//  Locationig.swift
//  DemoApp
//
//  Created by Simon Sestak on 10/08/2021.
//

import Foundation
import CoreLocation
import PromiseKit

class LocationHelper {
  let coder = CLGeocoder()

  func getLocation() -> Promise<CLPlacemark> {
    return CLLocationManager.requestLocation().lastValue.then { location in
        return self.coder.reverseGeocode(location: location).firstValue
      }
  }

  func searchForPlacemark(text: String) -> Promise<CLPlacemark> {
    return coder.geocode(text).firstValue
  }
}
