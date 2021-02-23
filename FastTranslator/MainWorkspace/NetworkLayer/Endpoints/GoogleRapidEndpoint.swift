//
//  GoogleRapidEndpoint.swift
//  FastTranslator
//
//  Created by anduser on 23.02.2021.
//  Copyright © 2021  Romanovskyi Volodymyr. All rights reserved.
//

import Foundation

struct GoogleRapidEndpoint: EndpointType {
    //static let shared = GoogleRapidEndpoint()
    
    var apiKey: String { return String("\(Bundle.main.object(forInfoDictionaryKey: "googleRapidTranslationAPIKEY"))")}
    var path: String { return "https://\(headers["x-rapidapi-host"])" }
    var methodApiPath: String { return "/translate" }
    var httpMethod: HTTPMethod { return .post }
    
    var headers: HTTPHeaders {
        return [
            "accept-encoding": "application/gzip",
            "x-rapidapi-key" : apiKey,
            "x-rapidapi-host": "google-translate20.p.rapidapi.com"
        ]
    }
    
    static func bodyConfiguration(postData: PostGoogleTransDataModel) -> Data {
        var httpBody = Data("text=\(postData.text)".data(using: String.Encoding.utf8)!) //TODO: handle exception
        httpBody.append("&sl=\(postData.sourceLanguage)".data(using: String.Encoding.utf8)!);
        httpBody.append("&tl=\(postData.targetLanguage)".data(using: String.Encoding.utf8)!)
        return httpBody
    }
    
//    var task: Data {
//        get(data: PostGoogleTransDataModel) {
//            return Data(
//        }
//    }
    
}
