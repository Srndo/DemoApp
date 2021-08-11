//
//  CollectionExtension.swift
//  DemoApp
//
//  Created by Simon Sestak on 11/08/2021.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        self.indices.contains(index) ? self[index] : nil
    }
}
