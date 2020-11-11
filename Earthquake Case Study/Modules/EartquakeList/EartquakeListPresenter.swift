//
//  EartquakeListPresenter.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation

class EartquakeListPresenter {

    // MARK: Properties

    weak var view: IEartquakeListView?
    var router: IEartquakeListRouter?
    var interactor: IEartquakeListInteractor?
    private (set) var earthquakeList: [Earthquake]?
}

extension EartquakeListPresenter: IEartquakeListPresenter {
    func refreshEartquakeList() {
        interactor?.getEartquakeList()
    }

    func getEartquakeList() -> [Earthquake] {
        return earthquakeList ?? []
    }

    func viewDidLoad() {
        self.refreshEartquakeList()
    }
}

extension EartquakeListPresenter: IEartquakeListInteractorToPresenter {
    func getEartquakeListRetrieved(list: [Earthquake]?) {
        earthquakeList = list
        view?.reloadTableView()
    }
}
