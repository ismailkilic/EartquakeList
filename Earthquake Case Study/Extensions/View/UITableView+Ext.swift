//
//  UITableView+Ext.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {

    func dequeue<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withIdentifier: T.nameOfClass, for: indexPath) as? T
    }

    func registerCell<T: UITableViewCell>(_ cell: T.Type) {
        register(nibFromClass(cell), forCellReuseIdentifier: cell.nameOfClass)
    }

    func registerFooterView<T: UITableViewHeaderFooterView>(_ cell: T.Type) {
        register(
            nibFromClass(cell),
            forHeaderFooterViewReuseIdentifier:
            cell.nameOfClass)
    }

    // Private
    fileprivate func nibFromClass(_ type: UIView.Type) -> UINib {
        return UINib(nibName: type.nameOfClass, bundle: nil)
    }
}

extension UITableView {
    var visibleSectionHeaders: [UITableViewHeaderFooterView] {
        get {
            var headerViews = [UITableViewHeaderFooterView]()
            if let visibleRows = self.indexPathsForVisibleRows {
                let visibleSections = visibleRows.map({$0.section})
                visibleSections.forEach { (index) in
                    if let view = self.headerView(forSection: index) {
                        headerViews.append(view)
                    }
                }

            }
            return headerViews
        }
    }

    private func indexesOfVisibleSections() -> [Int] {
        var visibleSectionIndexes = [Int]()

        for index in 0...numberOfSections {
            var headerRect: CGRect?

            if self.style == .plain {
                headerRect = self.rect(forSection: index)
            } else {
                headerRect = self.rectForHeader(inSection: index)
            }

            if headerRect != nil {
                let visiblePartOfTableView: CGRect = CGRect(
                    x: self.contentOffset.x,
                    y: self.contentOffset.y,
                    width: self.bounds.size.width,
                    height: self.bounds.size.height
                )

                if visiblePartOfTableView.intersects(headerRect!) {
                    visibleSectionIndexes.append(index)
                }
            }
        }

        return visibleSectionIndexes
    }
}
