//
//  TableViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableViewController: UIViewController, Storyboarded {

    @IBOutlet var tableView: UITableView!
    var viewModel: TableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        title = viewModel.title
        view.backgroundColor = viewModel.backgroundColor
        viewModel.filtredData.bind { _ in
            self.tableView.reloadData()
        }
        // swiftlint:disable:next line_length
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: viewModel.navButtonType, target: self, action: #selector(navButtonTap))
    }

    @objc func navButtonTap() {
        viewModel.navButtonTap()
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    private func configureTable() {
        let nib = UINib(nibName: "\(viewModel.cellType)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(viewModel.cellType)")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = viewModel.rowHeight
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filtredData.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(viewModel.cellType)") as! CustomCell
        cell.set(cell: viewModel.filtredData.value[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath)
    }
}
