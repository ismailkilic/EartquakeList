//
//  ApiProvider.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class ApiProvider: NSObject {

    static var shared: ApiProvider = ApiProvider()
    fileprivate var session = AF
    fileprivate var lock = NSLock()
    fileprivate var isRefreshing = false
    fileprivate var requestsToRetry: [(RetryResult) -> Void] = []

    typealias OnSuccess<T: Codable> = ((WSResponse<T>?) -> Void)?
    typealias OnError = (() -> Void)

    private override init() {
        super.init()
        session = Session()
    }

    @discardableResult
    func performRequest<T: Decodable>(route: APIRouter, decoder: DataDecoder = JSONDecoder(), onSuccess: OnSuccess<T>, onError: OnError? = nil) -> DataRequest {
        LoadingManager.shared.showLoading()
        return session.request(route)
            .validate(statusCode: 200..<400)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: WSResponse<T>.self, decoder: decoder) { (requestResponse) in
                LoadingManager.shared.hideLoading()

                switch requestResponse.result {
                case .success:
                    onSuccess?(requestResponse.value)
                case .failure:
                    guard let onError = onError else {
                        onSuccess?(nil)
                        return
                    }
                    onError()
                }
        }
    }

    private func showErrorToUserIfTargetIsAveaCep(error: String) {

    }
}
