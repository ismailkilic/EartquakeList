//
//  EartquakeListInteractor.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation

class EartquakeListInteractor {

    // MARK: Properties

    weak var output: IEartquakeListInteractorToPresenter?
    var api: APIClientInterface?
}

extension EartquakeListInteractor: IEartquakeListInteractor {
    func getEartquakeList() {
        api?.getEarthquakeList(completion: { [weak self] (response) in
            guard let self = self else { return }
            self.output?.getEartquakeListRetrieved(list: response?.results)
        })
    }
}
