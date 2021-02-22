//
//  RecievedGoogleTranslationDataModel.swift
//  FastTranslator
//
//  Created by User1 on 08.02.2021.
//  Copyright © 2021  Romanovskyi Volodymyr. All rights reserved.
//

import Foundation

struct RecievedGoogleTranslationDataModel: Decodable {
    let statusCode: Int
    let message: String
    let mainData: Data
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "code"
        case message = "message"
        case mainData = "data"
    }
    
    struct Data: Decodable {
        var pairsBySentences: [Pair]
        let pronunciation: String
        let source : Source
        let translation: String
        
        enum CodingKeys: String, CodingKey {
            case pairsBySentences = "pairs"
            case pronunciation //= "pronunciation"
            case source //= "source"
            case translation //= "translation"
        }
        
        struct Pair: Decodable {
            let sourceText: String
            let translatedText: String
            
            enum CodingKeys: String, CodingKey {
                case sourceText = "s"
                case translatedText = "t"
            }
        }
        
        struct Source: Decodable {
            let languageCode: LanguageCode
            let textInformation: TextInformation
            
            enum CodingKeys: String, CodingKey {
                case languageCode = "language"
                case textInformation = "text"
            }
            
            struct LanguageCode: Decodable {
                let didYouMean: Bool
                let isoCode: String
                
                enum CodingKeys: String, CodingKey {
                    case didYouMean //= "didYouMean"
                    case isoCode = "iso"
                }
            }
            
            struct TextInformation: Decodable {
                let autoCorrected: Bool
                let didYouMean: Bool
                let value: String
            }
        }
    }
}
