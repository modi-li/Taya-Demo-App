//
//  View+Extensions.swift
//  Taya-Demo-App
//
//  Created by Modi (Victor) Li.
//

import SwiftUI

extension View {
    
    func apply<V: View>(@ViewBuilder _ block: (Self) -> V) -> V {
        block(self)
    }
    
    @ViewBuilder
    func applyIf(_ condition: Bool, _ transform: (Self) -> some View) -> some View {
            if condition {
                transform(self)
            } else {
                self
            }
        }
    
    var isiOS26: Bool {
        if #available(iOS 26, *) {
            return true
        } else {
            return false
        }
    }
    
    var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
    
    func font(_ font: Font, _ fontWeight: Font.Weight, _ color: Color) -> some View {
        self
            .font(font.weight(fontWeight))
            .foregroundStyle(color)
            .tint(color)
    }
    
    func font(_ font: Font, _ color: Color) -> some View {
        self.font(font, .regular, color)
    }
    
    func font(_ font: Font, _ fontWeight: Font.Weight) -> some View {
        self.font(font, fontWeight, .textDefault)
    }
    
}
