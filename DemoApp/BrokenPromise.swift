//
//  BrokenPromise.swift
//  DemoApp
//
//  Created by Simon Sestak on 10/08/2021.
//

import Foundation
import PromiseKit

func brokenPromise<T>(method: String = #function) -> Promise<T> {
    // swiftlint:disable:next empty_parentheses_with_trailing_closure
    return Promise<T>() { seal in
        // swiftlint:disable:next line_length
        let err = NSError(domain: "DemoApp", code: 0, userInfo: [NSLocalizedDescriptionKey: "'\(method)' not yet implemented."])
        seal.reject(err)
    }
}
