//
//  TableViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableViewModel: BaseViewModel {
    enum SearchByConstants: String {
        case name
        case ID     // swiftlint:disable:this identifier_name
    }

    var coordinator: TableCoordinator!

    override var navButtonType: UIBarButtonItem.SystemItem? { .bookmarks }
    override var title: String { "Table" }

    let cellType = CustomCell.self
    let rowHeight: CGFloat = 100
    let searchBarTitles = ["By name", "By ID"]
    let searchBarPlaceholder = "Search"
    var ascending: Bool = true

    var searchBy: SearchByConstants = .name

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
        ascending.toggle()
        sort(ascending: ascending)
    }

    func setFilter(key: String?) {
        guard let key = key, key != "" else {
            filtredData.value = users
            return
        }
        filtredData.value = self.users.filter {
            switch searchBy {
            case .name:
                return $0.name.contains(key)
            case .ID:
                return $0.id == Int(key)
            }
        }
    }

    func sort(ascending: Bool) {
        if ascending {
            filtredData.value.sort { $0.id < $1.id }
        } else {
            filtredData.value.sort { $0.id > $1.id }
        }
    }

    func didSelect(at indexPath: IndexPath) {
        guard let user = filtredData.value[safe: indexPath.row] else { return }
        coordinator.toDetail(user: user)
    }
}
