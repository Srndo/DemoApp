//
//  Storyboarded.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

protocol Storyboarded {
    static func instantiate(name: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(name: String) -> Self {
        // swiftlint:disable:next identifier_name
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        // swiftlint:disable:next force_cast
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
