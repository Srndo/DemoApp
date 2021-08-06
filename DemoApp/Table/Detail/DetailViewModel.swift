//
//  CellViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailViewModel {

    var coordinator: DetailCoordinator!
    var userDidChange: ((DetailUserModel) -> Void)? {
        didSet {
            userDidChange?(user)
        }
    }

    let title = "Detail"
    var user: DetailUserModel {
       didSet {
            userDidChange?(user)
        }
    }

    init(coordinator: DetailCoordinator, userID: Int) {
        self.coordinator = coordinator
        self.user = DetailUserModel(nil)
        getData(userID: userID)
    }

    private func getData(userID: Int) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userID)") else { return }
        Networking().fetchForDetailData(url) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = user else { return }
            self.user = user
        }
    }

    func didFinish() {
        coordinator.didFinish()
    }
}

struct DetailUserModel: Decodable {
    let name: String
    let email: String
    let phone: String
    let address: Address

    init(_ user: User?) {
        self.name = user?.name ?? "asd"
        self.email = user?.email ?? ""
        self.phone = user?.phone ?? ""
        let geo = GeoLocation(lat: "", lng: "")
        self.address = Address(street: "", suite: "", city: "", zipcode: "", geo: geo)
    }
}
