//
//  TableViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import Foundation

class CellVM {
    let title = "Table"
    let service = Networking()
    var content: [CellViewModel] = []

    func fetchUsers(completition: @escaping () -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/") else { return }
        service.execute(url) { (users, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let users = users else { return }
            for user in users {
                self.content.append(CellViewModel(by: user))
            }
            completition()
        }
    }

    func filter(key: String, completition: @escaping (() -> [User])) {
    }
}

struct CellViewModel {
    var id: Int
    var name: String

    init(by user: User) {
        self.id = user.id
        self.name = user.name
    }
}
