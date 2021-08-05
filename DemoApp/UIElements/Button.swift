//
//  Button.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class Button: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(title: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        backgroundColor = .systemBlue
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }

    func center(to: CGPoint, _ offsetX: CGFloat = 0.0, _ offsetY: CGFloat = 0.0) {
        self.center.x = to.x + offsetX
        self.center.y = to.y + offsetY
    }
}
