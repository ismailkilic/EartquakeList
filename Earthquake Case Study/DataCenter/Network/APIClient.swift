//
//  APIClient.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//


import Alamofire
import Foundation

protocol APIClientInterface {

    typealias OnSuccess<T: Codable> = ((WSResponse<T>?) -> Void)?
    typealias OnError = (() -> Void)?

    // MARK: Initial
    func getEarthquakeList(completion: @escaping (WSResponse<[Earthquake]>?) -> Void)
}


class APIClient: APIClientInterface {
    func getEarthquakeList(completion: @escaping (WSResponse<[Earthquake]>?) -> Void) {
        ApiProvider.shared.performRequest(route: .earthquakeList,
        onSuccess: completion)
    }
}
