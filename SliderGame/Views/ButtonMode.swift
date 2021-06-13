//
//  ButtonMode.swift
//  SliderGame
//
//  Created by Елена Дранкина on 11.06.2021.
//

import SwiftUI

struct ButtonMode: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .frame(width: 300, height: 60)
            .background(color)
            .cornerRadius(20)
    }
}

extension View {
    func buttonAppearance(_ color: Color) -> some View {
        ModifiedContent(
            content: self,
            modifier: ButtonMode(color: color)
        )
    }
}
