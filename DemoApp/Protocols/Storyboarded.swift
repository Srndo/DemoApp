//
//  Storyboarded.swift
//  DemoApp
//
//  Created by Simon Sestak on 09/08/2021.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        // swiftlint:disable:next identifier_name
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // swiftlint:disable:next force_cast
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
