//
//  ButtonView.swift
//  SliderGame
//
//  Created by Елена Дранкина on 11.06.2021.
//

import SwiftUI

struct ButtonView: View {
    @Binding var showAlert: Bool
    let title: String
    let currentScore: Int
    let action: () -> Void
    let image: String
    
    var body: some View {        
        Button(action: action) {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                Text(title)
                    .font(.system(size: 25, weight: .bold, design: .serif))
                    .foregroundColor(.white)
            }
        }
        .buttonAppearance(.gray)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Ты набираешь \(currentScore) баллов"),
                message: Text("Из максимальных 100. \(currentScore > 95 ? "Молодец!" : "Попробуй улучшить результат!")"),
                dismissButton: .default(Text("Got it!"))
            )
        }
    }
    
    init(showAlert: Binding<Bool> = .constant(false), title: String, currentScore: Int = 0, action: @escaping () -> Void, image: String) {
        self._showAlert = showAlert
        self.title = title
        self.currentScore = currentScore
        self.action = action
        self.image = image
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            showAlert: .constant(true),
            title: "",
            currentScore: 5,
            action: {},
            image: "moon"
        )
    }
}
