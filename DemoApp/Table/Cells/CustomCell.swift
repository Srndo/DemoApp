//
//  CellViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class CustomCell: UITableViewCell {

    var image = UIImageView()
    var label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(image)
        addSubview(label)

        configureImage()
        configureLabel()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(cell: CellModel) {
        self.image.image = cell.image
        self.label.text = "\(cell.id) - \(cell.name)"
    }

    func set(customCellModel: CustomCellModel) {
        self.image.image = customCellModel.image
        self.label.text = customCellModel.text
    }

    private func configureImage() {
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
    }

    private func configureLabel() {
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
    }

    private func setConstraints() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        image.heightAnchor.constraint(equalToConstant: 80).isActive = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 16/9).isActive = true

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20).isActive = true
        label.heightAnchor.constraint(equalToConstant: 80).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}

protocol CustomCellModel {
    var image: UIImage { get }
    var text: String { get }
}

struct CellModel {
    var id: Int                                         // swiftlint:disable:this identifier_name
    var image: UIImage = UIImage(named: "placeholder")!
    var name: String

    init(by user: User) {
        self.id = user.id
        self.name = user.name
    }
}
