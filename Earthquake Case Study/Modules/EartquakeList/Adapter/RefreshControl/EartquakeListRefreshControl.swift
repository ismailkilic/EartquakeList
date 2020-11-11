//
//  EartquakeListRefreshControl.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import UIKit
import Lottie

class LottieRefreshControl: UIRefreshControl {
    fileprivate let animationView = Lottie.AnimationView(name: "earth-revoling")
    fileprivate var isAnimating = false

    fileprivate let maxPullDistance: CGFloat = 150

    override init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateProgress(with offsetY: CGFloat) {
        guard !isAnimating else { return }
        let progress = min(abs(offsetY / maxPullDistance), 1)
        animationView.currentProgress = progress
    }

    override func beginRefreshing() {
        super.beginRefreshing()
        isAnimating = true
        animationView.currentProgress = 0
        animationView.play()
    }

    override func endRefreshing() {
        super.endRefreshing()
        animationView.stop()
        isAnimating = false
    }
}

private extension LottieRefreshControl {
    func setupView() {
        // hide default indicator view
        tintColor = .clear
        animationView.loopMode = .loop
        addSubview(animationView)

        addTarget(self, action: #selector(beginRefreshing), for: .valueChanged)
    }

    func setupLayout() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.centerXAnchor.constraint(equalTo: centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: centerYAnchor),
            animationView.widthAnchor.constraint(equalToConstant: 50),
            animationView.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
}
