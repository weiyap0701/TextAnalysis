//
//  TextRouter.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 8/3/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import Alamofire

public enum TextRouter: URLRequestConvertible {
    
    enum Constants {
        static let baseUrl = "https://jlp.yahooapis.jp/MAService/V1"
        static let apiKey = "dj00aiZpPXV2VWhLQ3FYNzNRZiZzPWNvbnN1bWVyc2VjcmV0Jng9YjM-"
    }
    
    case analyse(String)
    
    var method: HTTPMethod {
        switch self {
        case .analyse:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .analyse:
            return "/parse"
        }
    }
    
    var query: String {
        switch self {
        case .analyse(let text):
            return "?appid=\(Constants.apiKey)&results=ma&sentence=\(text)"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let completeUrlString = (Constants.baseUrl + path + query).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url2 = try completeUrlString?.asURL()
        var request = URLRequest(url: url2!)
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        return request
    }
}
