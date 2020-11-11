//
//  EartquakeListAdapter.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation
import UIKit

class EartquakeListAdapter: NSObject {
    private let presenter: IEartquakeListPresenter

    init(presenter: IEartquakeListPresenter) {
        self.presenter = presenter
    }
}

extension EartquakeListAdapter: IBaseAdapter {
    func itemCount() -> Int {
        presenter.getEartquakeList().count
    }
}

extension EartquakeListAdapter: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemCount()
    }

    // Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row

        let cell =
            tableView.dequeueReusableCell(withIdentifier: EartquakeTableViewCell.nameOfClass,
                                          for: indexPath)
        if let cell = cell as? EartquakeTableViewCell {
            cell.model = presenter.getEartquakeList()[index]
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   let index = indexPath.row

//        if let operationType = presenter.getEartquakeList()[index] as Eartquake? {
//           // presenter.guestOperationTypeClicked(guestOperationType: operationType)
//        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //refreshControl.updateProgress(with: scrollView.contentOffset.y)
    }
}
