//
//  Connectivity.swift
//  DemoApp
//
//  Created by Simon Sestak on 12/08/2021.
//

import Alamofire

struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet: Bool {
      return self.sharedInstance.isReachable
    }
}
