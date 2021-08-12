//
//  TableViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableViewModel {

    var coordinator: TableCoordinator!

    let navButtonType: UIBarButtonItem.SystemItem = .search
    let title = "Table"
    let cellType = CustomCell.self
    let rowHeight: CGFloat = 100
    let backgroundColor: UIColor = .systemBackground

    private var users: [CellUserModel] = []
    var filtredData: Observable<[CellUserModel]> = Observable([])

    init(coordinator: TableCoordinator) {
        self.coordinator = coordinator
        getData()
    }

    private func getData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/") else { return }
        _ = Networking().fetchForTableData(url).done { users in
            for user in users {
                self.users.append(user)
            }
            self.filtredData.value = self.users
        }
    }

    func navButtonTap() {
        coordinator.showFilter()
    }

    func setFilter(key: String?) {
        if let key = key {
            self.filtredData.value = self.users.filter { $0.name.starts(with: key) }
        } else {
            self.filtredData.value = self.users
        }
    }

    func didSelect(at indexPath: IndexPath) {
        guard let user = filtredData.value[safe: indexPath.row] else { return }
        coordinator.toDetail(user: user)
    }
}
