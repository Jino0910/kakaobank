//
//  APIManager.swift
//  KakaobankTest
//
//  Created by rowkaxl on 04/05/2019.
//  Copyright © 2019 rowkaxl. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import SwiftyJSON

typealias APIResponseType = (code: HttpResponseCode, json: JSON)

class APIManager {
    
    static let shared = APIManager()
    
    class func request(target: Kakao) -> PrimitiveSequence<SingleTrait, APIResponseType> {
        return Single.create(subscribe: { (single) -> Disposable in
            
            let requestURL = URL(string: "\(target.baseURL.absoluteString)\(target.path)".URLEncode())!
            var request = URLRequest(url: requestURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
            request.httpMethod = target.method.rawValue
            request.allHTTPHeaderFields = target.headers
            
            if let param = try? JSONSerialization.data(withJSONObject: target.paramaters, options: []) {
                request.httpBody = param
            }
            
            
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
                
                guard error == nil else { return single(.error(NetworkError.networkError))}
                guard let data = data else { return single(.error(NetworkError.noDataError))}
                
                if let json = try? JSON(data: data) {
                    
                    var httpResponseCode: HttpResponseCode = .unknown
                    if let httpResponse = response as? HTTPURLResponse {
                        switch httpResponse.statusCode {
                        case 200...299: httpResponseCode = .code200
                        case 400...499: httpResponseCode = .code400
                        default: break
                        }
                    }
                    
                    single(.success((httpResponseCode, json)))
                } else {
                    single(.error(NetworkError.jsonParseError))
                }
                
            }).resume()
            
            return Disposables.create {}
        })
    }
}


//DispatchQueue.main.async(execute: {
