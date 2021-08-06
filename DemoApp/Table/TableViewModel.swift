//
//  TableViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableViewModel {

    var coordinator: TableCoordinator!

    init(coordinator: TableCoordinator) {
        self.coordinator = coordinator
    }

    let title = "Table"
    var users: [CellUserModel] = []

    func getData(completition: @escaping () -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/") else { return }
        Networking().fetchForTableData(url) { (users, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let users = users else { return }
            for user in users {
                self.users.append(user)
            }
            completition()
        }
    }

    func filter(key: String, completition: @escaping (() -> [User])) {
    }

    func didSelect(at indexPath: IndexPath) {
        guard let user = users[safe: indexPath.row] else { return }
        coordinator.toDetail(user: user)
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        self.indices.contains(index) ? self[index] : nil
    }
}
