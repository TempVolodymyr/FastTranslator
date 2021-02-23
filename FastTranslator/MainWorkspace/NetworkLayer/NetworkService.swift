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
typealias BodyParameters = [String: Any]

class NetworkService {
    let headers: [String: String] = [
        "accept-encoding": "application/gzip",
        "x-rapidapi-key" : "/",
        "x-rapidapi-host": "google-translate20.p.rapidapi.com"
    ]
    
    func makeRequest(dataModel: PostDataModelProtocol, cachePolicy: URLRequest.CachePolicy, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void ) {
        var postData = NSMutableData(data: "text=something is good".data(using: String.Encoding.utf8)!)
        postData.append("&sl=en".data(using: String.Encoding.utf8)!);
        postData.append("&tl=es".data(using: String.Encoding.utf8)!)
        
//        let request = NSMutableURLRequest(url: URL(string: headers["x-rapidapi-host"]! + "/translate")!)
        let request1 = NSMutableURLRequest(url: URL(string: "https://\(headers["x-rapidapi-host"])/translate")!)
        
        let request2: URLRequest = buildPostURLRequest(with: <#T##[String : String]#>, <#T##headers: [String : String]##[String : String]#>, httpBody: <#T##Data#>, httpMethod: <#T##HTTPMethod#>)
            
        let request = NSMutableURLRequest(url: URL(string: "https://google-translate20.p.rapidapi.com/translate")!,
                                            cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        session.dataTask(with: request as URLRequest, completionHandler: { (data, responce, error) -> Void in
            if (error != nil)
            {
                return
            }
            else {
                let httpResponce = responce as? HTTPURLResponse
                print(httpResponce)
            }
        }).resume()
    }
    
    private func buildPostURLRequest(with withParameters: [String: String], _ headers:[String: String], postData: PostDataModelProtocol, httpMethod: HTTPMethod) -> URLRequest? {
        switch postData {
        case is PostGoogleTransDataModel:
            let googleEndpoint = GoogleRapidEndpoint()
            var request = requestConfiguration(endPointType: googleEndpoint)
            request.httpBody = GoogleRapidEndpoint.bodyConfiguration(postData as PostGoogleTransDataModel)
            return request
        default: return nil
        }
        
        let request = NSMutableURLRequest(url: URL(string: "https://google-translate20.p.rapidapi.com/translate")!,
                                            cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 1)
        request.httpMethod = httpMethod.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = httpBody
    }
    
    private func buildGetURLRequest(with withParameters: [String: String], _ headers:[String: String], httpMethod: HTTPMethod) {
        
    }
    
    private func requestConfiguration(endPointType: EndpointType, cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalCacheData) -> URLRequest {
        var request =  URLRequest(url: URL(string: (endPointType.path + endPointType.methodApiPath))!, cachePolicy: cachePolicy, timeoutInterval: 10.0);
        request.allHTTPHeaderFields = endPointType.headers
        request.httpMethod = endPointType.httpMethod.rawValue
        //request.httpBody = bodyConfiguration(postData: postData) //TODO: сделать метод вариативным
        return request
    }
    
    private func configureRequest(dataModel: PostDataModelProtocol) -> Data {
        let data = dataModel as! PostGoogleTransDataModel
        let dataModel1 = Data((data.targetLanguage?.data(using: String.Encoding.utf8))!)
        dataModel1.append(data.)
        
    }
    
}
