//
//  EartquakeListContract.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation

protocol IEartquakeListView: IBaseView {
    func reloadTableView()
}

protocol IEartquakeListPresenter: IBasePresenter {
    func refreshEartquakeList()
    func getEartquakeList() -> [Earthquake]
}

protocol IEartquakeListInteractor: class {
    func getEartquakeList()
}

protocol IEartquakeListInteractorToPresenter: class {
    func getEartquakeListRetrieved(list: [Earthquake]?)
}

protocol IEartquakeListRouter: class {
    // TODO: Declare wireframe methods
}
