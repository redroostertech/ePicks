//
//  APIService.swift
//  PopViewers
//
//  Created by Michael Westbrooks II on 5/13/18.
//  Copyright © 2018 MVPGurus. All rights reserved.
//

import Foundation
import Alamofire

class APIRepository {
    
    static let shared = APIRepository(baseURL: API.baseURL)
    
    private let baseURL: String!
    
    private init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func getBaseURL() -> String {
        return self.baseURL
    }
    
    func buildRequest(path: String = "",
                      method: HTTPMethod = .get,
                      parameters: Parameters = [:],
                      apiKey api: String = "",
                      andAccessKey access: String = "",
                      headers: HTTPHeaders = [:],
                      completion: @escaping (Any?, Error?) -> Void)
    {
        let path = path
        let urlString = self.baseURL + path
        let method = method
        let parameters = parameters
        let apiKey = api
        let accessKey = access
        
        var headers = [
            "Accept": "application/json",
            "wsc-api-key": apiKey,
            "wsc-access-key": accessKey
        ]
        
        for key in headers.keys {
            headers[key] = headers[key]
        }
        
        performRequest(urlString: urlString, method: method, parameters: parameters, headers: headers) {
            (results, error) in
            completion(results, error)
        }
    }
    
    private func performRequest(urlString: String,
                                method: HTTPMethod,
                                parameters: Parameters,
                                headers: HTTPHeaders,
                                completion: @escaping (Any?, Error?) -> Void)
    {
        Alamofire.request(urlString,
                          method: method,
                          parameters: parameters,
                          encoding: URLEncoding.httpBody,
                          headers: headers)
            .responseJSON {
                response in
                
                switch response.result {
                case .success:
                    if let json = response.result.value {
                        completion(json, nil)
                    } else {
                        completion(nil, Errors.JSONResponseError)
                    }
                case .failure(let error):
                    print(error)
                    completion(nil, error)
                }
                
        }
    }
}
