//
//  TableViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableViewController: UITableViewController {

    var viewModel: TableViewModel!

    init(viewModel: TableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        title = viewModel.title
        view.backgroundColor = .systemBackground
        viewModel.filtredUsers.bind { _ in
            self.tableView.reloadData()
        }
        // swiftlint:disable:next line_length
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: viewModel.navButtonType, target: self, action: #selector(navButtonTap))
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

    }

    private func configureTable() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
    }

    @objc func navButtonTap() {
        viewModel.navButtonTap()
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filtredUsers.value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomCell
        cell.set(cell: viewModel.filtredUsers.value[indexPath.row])
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath)
    }
}
