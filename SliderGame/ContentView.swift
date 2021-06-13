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
    var score: Int {
        lround(SliderKit(currentValue: $currentValue, targetValue: targetValue).score * 100)
    }
    
    var body: some View {
        ZStack{
            Color(CustomColors().warmBlack)
                .ignoresSafeArea()
        VStack(spacing: 30) {
                Text("Перемести бегунок слайдера как можно ближе к значению :")
                    .foregroundColor(Color(CustomColors().coldWhite))
                    .font(.system(size: 20, weight: .bold, design: .serif))
                    .multilineTextAlignment(.center)
                Text ("\(targetValue)")
                    .foregroundColor(Color(CustomColors().coldWhite))
                    .font(.system(size: 40, weight: .bold))
            SliderKit(currentValue: $currentValue, targetValue: targetValue)
            ButtonView(title: "Проверь меня!", image: "hand.tap.fill") {
                showAlert = true
            }
                .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Ты набираешь \(score) баллов"),
                    message: Text("Из максимальных 100. \(score > 95 ? "Молодец!" : "Попробуй улучшить результат!")"),
                    dismissButton: .default(Text("Got it!"))
                )
            }
            ButtonView(title: "Давай еще раз!", image:  "goforward") {
                targetValue = Int.random(in: 1...100)
            }
        }
        .padding()
    }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
