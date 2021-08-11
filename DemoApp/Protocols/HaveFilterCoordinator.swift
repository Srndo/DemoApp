//
//  HaveFilterCoordinator.swift
//  DemoApp
//
//  Created by Simon Sestak on 11/08/2021.
//

import Foundation

protocol HaveFilterCoordinator: Coordinator {
    func showFilter()
    func filterDidFinish(with key: String?)
}
