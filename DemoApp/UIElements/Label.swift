//
//  Label.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class MyLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        fill(title)
    }

    func center(to: CGPoint, _ offsetX: CGFloat = 0.0, _ offsetY: CGFloat = 0.0) {
        self.center.x = to.x + offsetX
        self.center.y = to.y + offsetY
    }

    func fill(_ text: String) {
        self.text = text
        sizeToFit()
    }
}
