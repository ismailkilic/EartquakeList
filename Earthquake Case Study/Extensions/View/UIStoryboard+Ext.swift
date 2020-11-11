//
//  UIStoryboard+Ext.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    static func loadViewController<T>() -> T where T: StoryboardLoadable, T: UIViewController {
        return UIStoryboard(name: T.storyboardName(),
                            bundle: nil).instantiateViewController(withIdentifier: T.storyboardIdentifier()) as! T
    }
}
