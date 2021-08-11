//
//  CellViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailViewModel {

    var coordinator: DetailCoordinator!

    let title = "Detail"
    var user: Observable<DetailUserModel>

    init(coordinator: DetailCoordinator, user: CellUserModel) {
        self.coordinator = coordinator
        self.user = Observable(DetailUserModel(user))
        getData(userID: user.id)
    }

    private func getData(userID: Int) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userID)") else { return }
        Networking().fetchForDetailData(url) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = user else { return }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.user.value = user
            }
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

    init(_ cellUser: CellUserModel) {
        self.name = cellUser.name
        self.email = ""
        self.phone = ""
        let geo = GeoLocation(lat: "", lng: "")
        self.address = Address(street: "", suite: "", city: "", zipcode: "", geo: geo)
    }
}
