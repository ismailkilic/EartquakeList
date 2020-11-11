//
//  Loading.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import UIKit
import Lottie

@IBDesignable internal class Loading: UIView {

    // MARK: Properties

    @IBOutlet weak var loadingAnimationView: AnimationView!

    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    class func instanceFromNib() -> UIView {
        guard let view = UINib(nibName: String(describing: Self.self), bundle: nil)
            .instantiate(withOwner: nil, options: nil)[0] as? UIView
            else { return UIView() }
        return view
    }

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        if loadingAnimationView != nil {
            setDefaultLoading()
        }
    }

    // MARK: Methods

    func setFrame(_ window: UIWindow) {
        self.frame = window.frame
        self.bounds = window.bounds
        self.layoutIfNeeded()
    }

    func setDefaultLoading() {
        loadingAnimationView.backgroundBehavior = .pauseAndRestore
        loadingAnimationView.loopMode = .loop
        loadingAnimationView.animation = Animation.named("earth-revoling")
        loadingAnimationView.play()
    }
}
