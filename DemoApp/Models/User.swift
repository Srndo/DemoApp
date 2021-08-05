//
//  User.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import Foundation

struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address

struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: GeoLocation
}

// MARK: - Geo

struct GeoLocation: Codable {
    let lat, lng: String
}

// MARK: - Company

struct Company: Codable {
    let name, catchPhrase, bs: String
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }

    func contains(_ key: String) -> Bool {
        if name.contains(key) || username.contains(key) {
            return true
        }
        guard let intKey = Int(key) else { return false }
        return id == intKey
    }
}
