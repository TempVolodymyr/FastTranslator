//
//  NetworkService.swift
//  FastTranslator
//
//  Created by anduser on 23.02.2021.
//  Copyright © 2021  Romanovskyi Volodymyr. All rights reserved.
//

import Foundation

protocol NetServiceProt {
    
}

typealias HTTPHeaders = [String: String]
typealias Parameters = [String: Any]

class NetworkService {
    
    func makeRequest(dataModel: PostDataModelProtocol, cachePolicy: URLRequest.CachePolicy, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ) {
        
        
        let request: URLRequest = buildPostURLRequest(postData: dataModel)!
        
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: { (data, response, error) -> Void in
            if (error != nil)
            {
                return
            }
            else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse as Any)
            }
        }).resume()
    }
    
    private func buildPostURLRequest(postData: PostDataModelProtocol) -> URLRequest? {
        switch postData {
        case is PostGoogleTransDataModel:
            let googleEndpoint = GoogleRapidEndpoint()
            var request = requestConfiguration(endPointType: googleEndpoint)
            request.httpBody = GoogleRapidEndpoint.bodyConfiguration(postData: postData as! PostGoogleTransDataModel)
            return request
        default: return nil
        }
    }
    
    private func buildGetURLRequest(with withParameters: Parameters, _ headers:[String: String], httpMethod: HTTPMethod) {
        
    }
    
    private func requestConfiguration(endPointType: EndpointType, cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalCacheData) -> URLRequest {
        var request =  URLRequest(url: URL(string: (endPointType.path + endPointType.methodApiPath))!, cachePolicy: cachePolicy, timeoutInterval: 10.0);
        request.allHTTPHeaderFields = endPointType.headers
        request.httpMethod = endPointType.httpMethod.rawValue
        return request
    }
    
}
