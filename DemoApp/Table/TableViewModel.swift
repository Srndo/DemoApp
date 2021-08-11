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
        getData()
    }

    let navButtonType: UIBarButtonItem.SystemItem = .search
    let title = "Table"
    private var users: [CellUserModel] = []
    var filtredUsers: Observable<[CellUserModel]> = Observable([])

    private func getData() {
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
            self.filtredUsers.value = self.users
        }
    }

    func navButtonTap() {
        coordinator.showFilter()
    }

    func setFilter(key: String?) {
        if let key = key {
            self.filtredUsers.value = self.users.filter { $0.name.starts(with: key) }
        } else {
            self.filtredUsers.value = self.users
        }
        DispatchQueue.main.async {
            self.coordinator.viewController?.tableView.reloadData()
        }
    }

    func didSelect(at indexPath: IndexPath) {
        guard let user = filtredUsers.value[safe: indexPath.row] else { return }
        coordinator.toDetail(user: user)
    }
}

extension Collection {
    subscript(safe index: Index) -> Element? {
        self.indices.contains(index) ? self[index] : nil
    }
}
