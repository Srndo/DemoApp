//
//  WeatherModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 10/08/2021.
//

import Foundation

struct WeatherModel: Codable {
  let main: Temperature
  let weather: [Weather]
  var name: String = "Error: invalid jsonDictionary! Verify your appID is correct"
}

struct Weather: Codable {
  let icon: String
  let description: String
}

struct Temperature: Codable {
  let temp: Double
}
