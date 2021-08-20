//
//  CellViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class CustomCell: UITableViewCell {
    var viewModel: CustomCellViewModel!

    @IBOutlet weak var sideButton: UIButton!
    @IBOutlet weak var textView: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func inicialize() {
        roundHeaderImage()
        guard viewModel != nil else { fatalError("CustomCell viewModel is nil") }
        backgroundColor = .Background.blueLight
        setBindings()
    }

    private func setBindings() {
        viewModel.headerText.bind { _ in
            self.headerText.text = self.viewModel.headerText.value
        }
        viewModel.headerImage.bind { _ in
            self.headerImageView.image = self.viewModel.headerImage.value
        }
        viewModel.headerTitle.bind { _ in
            self.headerTitle.text = self.viewModel.headerTitle.value
        }
        viewModel.textView.bind { _ in
            self.textView.text = self.viewModel.textView.value
        }
    }

    private func roundHeaderImage() {
        headerImageView.layer.backgroundColor = UIColor.clear.cgColor
        headerImageView.layer.cornerRadius = 30
        headerImageView.layer.borderWidth = 2.0
        headerImageView.layer.masksToBounds = true
        headerImageView.layer.borderColor = UIColor.gray.cgColor
    }
}
