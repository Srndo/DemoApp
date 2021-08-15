//
//  CustomCellViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 12/08/2021.
//

import UIKit

class CustomCellViewModel {
    var textView: Observable<String> = Observable("")
    var headerImage: Observable<UIImage?> = Observable(nil)
    var headerTitle: Observable<String> = Observable("")
    var headerText: Observable<String> = Observable("")

    init(cellUser: CellUserModel) {
        self.headerImage.value = UIImage(named: "landscape")!
        self.headerTitle.value = cellUser.name
        self.headerText.value = String(cellUser.id)
        self.textView.value = dynamicLengthOfLabel()
    }

    private func dynamicLengthOfLabel() -> String {
        // swiftlint:disable:next line_length
        let text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        return String(repeating: text, count: Int.random(in: 1..<5))
    }
}
