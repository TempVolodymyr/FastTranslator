//
//  EndpointsProtocol.swift
//  FastTranslator
//
//  Created by anduser on 23.02.2021.
//  Copyright © 2021  Romanovskyi Volodymyr. All rights reserved.
//

import Foundation

protocol EndpointType {
    var path: String { get }
    //var apiKey: String { get }
    var methodApiPath: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders  { get }
    
}
