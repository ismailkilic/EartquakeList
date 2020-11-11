//
//  NSObject+Ext.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
