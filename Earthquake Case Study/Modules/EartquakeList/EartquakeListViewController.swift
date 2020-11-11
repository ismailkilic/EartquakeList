//
//  EartquakeListViewController.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation
import UIKit

class EartquakeListViewController: BaseViewController, StoryboardLoadable {

    // MARK: Properties
    @IBOutlet private weak var tableView: UITableView!
    private let refreshControl = LottieRefreshControl()

    var presenter: IEartquakeListPresenter?
    var adapter: EartquakeListAdapter?

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Eartquake List"
    }
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad?()
        prepareTableView()
    }

    fileprivate func prepareTableView() {
        tableView.dataSource = adapter
        tableView.delegate = adapter
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        tableView.registerCell(EartquakeTableViewCell.self)


        refreshControl.addTarget(self, action: #selector(refreshEartquakeList(_:)), for: .valueChanged)

        tableView.addSubview(refreshControl)
    }

    @objc private func refreshEartquakeList(_ sender: Any) {
        presenter?.refreshEartquakeList()
    }
}

extension EartquakeListViewController: IEartquakeListView {
    func reloadTableView() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}
