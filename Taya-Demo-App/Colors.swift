//
//  Colors.swift
//  Taya-Demo-App
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

extension Color {
    
    static func fromRGB(_ red: Double, _ green: Double, _ blue: Double) -> Color {
        return Color(red: red / 255.0, green: green / 255.0, blue: blue / 255.0)
    }
    
    static let brand100 = fromRGB(124, 191, 208)
    
    static let brand200 = fromRGB(83, 183, 205)
    
    static let brand300 = fromRGB(42, 112, 140)
    
    static let brand400 = fromRGB(32, 100, 126)
    
    static let cream100 = fromRGB(254, 249, 231)
    
    static let shade500 = fromRGB(80, 112, 124)
    
    static let shade600 = fromRGB(60, 90, 104)
    
    static let shade700 = fromRGB(40, 69, 82)
    
    static let shade800 = fromRGB(20, 48, 59)
    
    static let textDefault = shade800
}
