//
//  Earthquake.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation

// MARK: - Paramaters
struct Earthquake: Codable {
    let timestamp: String?
    let latitude, longitude, depth, size: Double?
    let quality: Double?
    let humanReadableLocation: String?
}
