//
//  GameSlider.swift
//  SliderGame
//
//  Created by Елена Дранкина on 29.07.2021.
//

import SwiftUI

struct GameSlider: View {
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack {
            Text("Перемести бегунок слайдера как можно ближе к значению :")
                .foregroundColor(Color(CustomColors().coldWhite))
                .font(.system(size: 20, weight: .bold, design: .serif))
                .multilineTextAlignment(.center)
            Text ("\(targetValue)")
                .foregroundColor(Color(CustomColors().coldWhite))
                .font(.system(size: 40, weight: .bold))
            
            HStack {
                Text("0")
                    .foregroundColor(Color(CustomColors().coldWhite))
                SliderKit(currentValue: $currentValue, alpha: alpha, color: color)
                Text("100")
                    .foregroundColor(Color(CustomColors().coldWhite))
            }
            .padding()
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(
            currentValue: .constant(50),
            targetValue: 100,
            color: .red,
            alpha: 100
        )
    }
}
