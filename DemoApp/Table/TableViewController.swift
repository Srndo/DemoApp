//
//  TableViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableVC: UITableViewController, Coordinating {
    var coordinator: Coordinator?
    var viewModel: TableVM!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        title = viewModel.title
        view.backgroundColor = .systemBackground
        viewModel.fetchUsers {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinish()
    }

    private func configureTable() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }
}

extension TableVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.set(cell: viewModel.users[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coordinator = coordinator as? TableC else { return }
        coordinator.toDetail(viewModel.users[indexPath.row].id)
    }
}
