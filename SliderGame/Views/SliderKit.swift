//
//  SliderKit.swift
//  SliderGame
//
//  Created by Елена Дранкина on 11.06.2021.
//

import SwiftUI

struct SliderKit: UIViewRepresentable {
    @Binding var currentValue: Double
    
    let alpha: Int
    let color: UIColor

    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.minimumTrackTintColor = CustomColors().deepTurquois
        slider.maximumTrackTintColor = CustomColors().pastelTurquois

        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
      Coordinator(value: $currentValue)
    }
}

struct SliderKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderKit(currentValue: .constant(50), alpha: 100, color: .blue)
    }
}

extension SliderKit {
    
    class Coordinator: NSObject {
        
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}
