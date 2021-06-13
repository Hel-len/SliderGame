//
//  ButtonView.swift
//  SliderGame
//
//  Created by Елена Дранкина on 11.06.2021.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let image: String
    let action: () -> Void
    
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
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "somet", image: "star.fill", action: {})
    }
}
