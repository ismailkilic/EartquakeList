//
//  BaseContract.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation
import UIKit

// MARK: - View
protocol IBaseView: class {
    func showProgressHUD()
    func hideProgressHUD()
}

extension UIViewController: IBaseView {
    func showProgressHUD() {
        LoadingManager.shared.showLoading()
    }

    func hideProgressHUD() {
        LoadingManager.shared.hideLoading()
    }
}

// MARK: - Presenter
@objc protocol IBasePresenter: class {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewDidAppear()
}

protocol IBaseInteractorToPresenter: class {
    func wsErrorOccurred(message: String)
}

// MARK: - Interactor
protocol IBaseInteractor: class {}

// MARK: - Router
protocol IBaseRouter: class {}

protocol IBaseAdapter: class {
    func isLastItem(_ index: Int) -> Bool
    func itemCount() -> Int
}

extension IBaseAdapter {
    func isLastItem(_ index: Int) -> Bool {
        itemCount() == index
    }
}
