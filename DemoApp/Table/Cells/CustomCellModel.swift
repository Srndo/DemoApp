//
//  CustomCellModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 06/08/2021.
//

import UIKit

struct CellModel: Codable {
    var id: Int                                         // swiftlint:disable:this identifier_name
    var image: UIImage = UIImage(named: "placeholder")!
    var name: String

    init(by user: User) {
        self.id = user.id
        self.name = user.name
    }

    enum CodingKeys: String, CodingKey {
        case id                                         // swiftlint:disable:this identifier_name
        case name
    }
}
