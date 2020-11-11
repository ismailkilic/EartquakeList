//
//  WSResponse.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation
// MARK: - Paramaters
import Foundation
// MARK: - Paramaters
struct WSResponse<T: Codable>: Codable {
    let results: T?

    enum CodingKeys: String, CodingKey {
        case results
    }

}
