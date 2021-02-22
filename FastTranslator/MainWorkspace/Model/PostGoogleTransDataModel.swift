//
//  PostGoogleTransDataModel.swift
//  FastTranslator
//
//  Created by User1 on 08.02.2021.
//  Copyright © 2021  Romanovskyi Volodymyr. All rights reserved.
//

import Foundation

struct PostGoogleTransDataModel : Encodable {
    var targetLanguage: String?
    var sourceLanguage: String?
    var text: String?
    
    enum CodingKeys: String, CodingKey {
        case targetLanguage = "tl"
        case sourceLanguage = "sl"
        case text
    }
}
