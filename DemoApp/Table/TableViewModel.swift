//
//  TableViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableViewModel: BaseViewModel {

    var coordinator: TableCoordinator!

    override var navButtonType: UIBarButtonItem.SystemItem? { .search }
    override var title: String { "Table" }
    override var backgroundColor: UIColor { .systemBackground }

    let cellType = CustomCell.self
    let rowHeight: CGFloat = 100

    private var users: [CellUserModel] = []
    var filtredData: Observable<[CellUserModel]> = Observable([])

    init(coordinator: TableCoordinator) {
        self.coordinator = coordinator
        super.init()
        getData()
    }

    private func getData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/") else { return }
        _ = Networking().fetchForTableData(url).done { users in
            for user in users {
                self.users.append(CellUserModel(by: user))
            }
            self.filtredData.value = self.users
        }
    }

    override func navButtonTapped() {
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
