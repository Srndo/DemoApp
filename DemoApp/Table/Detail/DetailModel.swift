//
//  DetailModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 11/08/2021.
//

import Foundation

struct DetailUserModel: Decodable {
    let name: String
    let email: String
    let phone: String
    let address: Address

    init(_ user: User?) {
        self.name = user?.name ?? "asd"
        self.email = user?.email ?? ""
        self.phone = user?.phone ?? ""
        let geo = user?.address.geo ?? GeoLocation(lat: "", lng: "")
        self.address = user?.address ??  Address(street: "", suite: "", city: "", zipcode: "", geo: geo)
    }

    init(_ cellUser: CellUserModel) {
        self.name = cellUser.name
        self.email = ""
        self.phone = ""
        let geo = GeoLocation(lat: "", lng: "")
        self.address = Address(street: "", suite: "", city: "", zipcode: "", geo: geo)
    }
}
