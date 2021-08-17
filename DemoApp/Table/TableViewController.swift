//
//  TableViewController.swift
//  DemoApp
//
//  Created by Simon Sestak on 04/08/2021.
//

import UIKit

class TableViewController: BaseViewController<TableViewModel>, Storyboarded {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        viewModel.filtredData.bind { _ in
            self.tableView.reloadData()
        }
    }
}

extension TableViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        viewModel.setFilter(key: nil)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.setFilter(key: searchText)
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        viewModel.searchBy = selectedScope == 0 ? .name : .ID
        viewModel.setFilter(key: searchBar.text)
    }
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    private func configureTable() {
        let nib = UINib(nibName: "\(viewModel.cellType)", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "\(viewModel.cellType)")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = viewModel.rowHeight

        configureSearchBar()
        tableView.tableHeaderView = searchBar
    }

    private func configureSearchBar() {
        searchBar.delegate = self
        searchBar.scopeButtonTitles = viewModel.searchBarTitles
        searchBar.placeholder = viewModel.searchBarPlaceholder
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filtredData.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(viewModel.cellType)") as! CustomCell
        cell.viewModel = CustomCellViewModel(cellUser: viewModel.filtredData.value[indexPath.row])
        cell.inicialize()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelect(at: indexPath)
    }

    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let selectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRow, animated: true)
        }
    }
}
