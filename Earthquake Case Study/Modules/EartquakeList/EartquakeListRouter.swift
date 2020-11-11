//
//  EartquakeListRouter.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation
import UIKit

class EartquakeListRouter {

    // MARK: Properties

    weak var view: UIViewController?

    // MARK: Static methods

    static func setupModule() -> EartquakeListViewController {
        let viewController = UIStoryboard.loadViewController() as EartquakeListViewController
        let presenter = EartquakeListPresenter()
        let router = EartquakeListRouter()
        let interactor = EartquakeListInteractor()
        let apiClient = APIClient()
        let adapter = EartquakeListAdapter(presenter: presenter)

        viewController.presenter =  presenter
        viewController.modalPresentationStyle = .fullScreen
        viewController.adapter = adapter

        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor

        router.view = viewController

        interactor.output = presenter
        interactor.api = apiClient

        return viewController
    }
}

extension EartquakeListRouter: IEartquakeListRouter {
    // TODO: Implement wireframe methods
}
