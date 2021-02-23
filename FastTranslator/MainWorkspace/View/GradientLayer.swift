//
//  GradientLayer.swift
//  FastTranslator
//
//  Created by User1 on 11.02.2021.
//  Copyright © 2021  Romanovskyi Volodymyr. All rights reserved.
//

import Foundation
import UIKit

class BackgroundGradient {
    static var gradientLayer: CAGradientLayer
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1)
        let topColor = #colorLiteral(red: 1, green: 0.2115234682, blue: 0.837081854, alpha: 1).cgColor
        let bottomColor = #colorLiteral(red: 0.5563425422, green: 0.9793455005, blue: 0, alpha: 1).cgColor
        
        gradientLayer.colors = [topColor, bottomColor]
        gradientLayer.locations =  [-0.1,  1]
        return gradientLayer
    }
}
