//
//  CellViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailVM {
    var userDidChange: ((DetailUserVM) -> Void)? {
        didSet {
            userDidChange?(user)
        }
    }

    let title = "Detail"
    var user: DetailUserVM {
       didSet {
            userDidChange?(user)
        }
    }

    init(userID: Int) {
        self.user = DetailUserVM(nil)
        fetchUser(userID: userID)
    }

    private func fetchUser(userID: Int) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userID)") else { return }
        Networking().fetch(url) { (users, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = users?.first else { return }
            self.user = DetailUserVM(user)
        }
    }
}

struct DetailUserVM {
    let name: String
    let email: String
    let phone: String
    let address: String

    init(_ user: User?) {
        self.name = user?.name ?? ""
        self.email = user?.email ?? ""
        self.phone = user?.phone ?? ""
        self.address = "\(user?.address.city ?? "") \(user?.address.zipcode ?? "")"
    }
}
