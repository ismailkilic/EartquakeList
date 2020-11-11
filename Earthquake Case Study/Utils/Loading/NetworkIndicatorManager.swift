//
//  NetworkIndicatorManager.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation
import UIKit

class LoadingManager: NSObject {

    static let shared = LoadingManager()
    private var isShowing: Bool = false
    private var loadingView: Loading?
    private var animationDuration = 0.25

    private override init() {
        super.init()
    }

    private var activityCount = 0 {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                UIApplication.shared.isNetworkActivityIndicatorVisible = self.activityCount > 0
            }
        }
    }

    private var loadingCount = 0 {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                if self.loadingCount > 0 {
                    self.showLoadingView()
                } else {
                    self.hideLoadingView()
                }
            }
        }
    }

    func showLoading() {
        activityCount += 1
        loadingCount += 1
    }

    func hideLoading() {
        if activityCount > 0 { activityCount -= 1 }
        if loadingCount > 0 { loadingCount -= 1 }
    }

    func showLoading(_ needToShowLoading: Bool) {
        activityCount += 1
        if needToShowLoading { loadingCount += 1 }
    }

    func hideLoading(_ needToShowLoading: Bool) {
        if activityCount > 0 { activityCount -= 1 }
        if needToShowLoading && loadingCount > 0 { loadingCount -= 1 }
    }
}

// MARK: View Handler
extension LoadingManager {
    private func showLoadingView() {
        if isShowing {
            return
        }

        if let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            guard let loadingView = Loading.instanceFromNib() as? Loading
                else { return }

            loadingView.setFrame(window)

            window.visibleViewController()?.view.addSubview(loadingView)
            self.loadingView = loadingView

            UIView.animate(withDuration: animationDuration) {
                self.loadingView?.alpha = 1.0
            }

            isShowing = true
        }
    }

    private func hideLoadingView() {
        if !isShowing {
            return
        }

        if let loadingView = self.loadingView {
            UIView.animate(withDuration: animationDuration, delay: 0.0, options: [], animations: {
                loadingView.alpha = 0.0
            }, completion: { (_: Bool) in
                loadingView.removeFromSuperview()
            })

            isShowing = false
        }
    }
}
