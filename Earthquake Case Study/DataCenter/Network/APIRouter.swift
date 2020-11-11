//
//  APIRouter.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import Alamofire
import Foundation

enum APIRouter: URLRequestConvertible {
    case earthquakeList
    case test

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .earthquakeList:
            return .get
        default:
            return .post
        }
    }

    // MARK: - Path
    var path: String {
        switch self {
        case .earthquakeList: return "/earthquake/is"
        default: return ""
        }
    }
    // MARK: - baseURL
    private var baseURL: String {
        return "https://apis.is"
    }

    // MARK: - ParameterEncoding
    private var encoder: ParameterEncoding {
        if self.method == HTTPMethod.get {
            return URLEncoding()
        } else {
            return JSONEncoding()
        }
    }

    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .earthquakeList:
            return nil
        default:
            return nil
        }
    }

    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {

        // Request URL
        let url = try baseURL.asURL().appendingPathComponent(path).absoluteString.removingPercentEncoding!.asURL()
        var urlRequest = URLRequest(url: url)

        // HTTP Method
        urlRequest.httpMethod = method.rawValue

        // Headers
        let jsonHeader = "application/json"
        urlRequest.headers.add(.accept(jsonHeader))
        urlRequest.headers.add(.contentType(jsonHeader))

        do {
            urlRequest = try encoder.encode(urlRequest, with: parameters)
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }

        return urlRequest
    }

    private func queryString(_ value: String, params: Parameters) -> URL? {
        var components = URLComponents(string: value)
        components?.queryItems = params.map { element in
            URLQueryItem(name: element.key,
                                    value: element.value as? String)
        }

        return components?.url
    }
}
