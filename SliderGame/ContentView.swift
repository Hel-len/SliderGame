//
//  ContentView.swift
//  SliderGame
//
//  Created by Елена Дранкина on 11.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue: Double = 0
    @State private var showAlert = false
    
    var body: some View {
        ZStack{
            Color(CustomColors().warmBlack)
                .ignoresSafeArea()
            VStack(spacing: 30) {

                GameSlider(
                    currentValue: $currentValue,
                    targetValue: targetValue,
                    color: .white,
                    alpha: computeScore())
                
                ButtonView(
                    showAlert: $showAlert,
                    title: "Проверь меня!",
                    currentScore: computeScore(),
                    action: { showAlert = true },
                    image: "checkmark.seal"
                )
                ButtonView(
                    showAlert: $showAlert,
                    title: "Начать заново!",
                    currentScore: 0,
                    action: { targetValue = Int.random(in: 1...100) },
                    image: "goforward")
            }
            .padding()
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
