//
//  CellViewModel.swift
//  DemoApp
//
//  Created by Simon Sestak on 05/08/2021.
//

import UIKit

class DetailViewModel: BaseViewModel {

    var coordinator: DetailCoordinator!

    override var title: String { "Detail" }
    var user: Observable<DetailUserModel>

    init(coordinator: DetailCoordinator, user: CellUserModel) {
        self.coordinator = coordinator
        self.user = Observable(DetailUserModel(user))
        super.init()
        getData(userID: user.id)
    }

    private func getData(userID: Int) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(userID)") else { return }
        _ = Networking().fetchForDetailData(url).done { user in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.user.value = DetailUserModel(user)
            }
        }
    }

    func didFinish() {
        coordinator.didFinish()
    }
}
