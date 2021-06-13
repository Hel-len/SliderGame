//
//  SliderKit.swift
//  SliderGame
//
//  Created by Елена Дранкина on 11.06.2021.
//

import SwiftUI

struct SliderKit: UIViewRepresentable {
    @Binding var currentValue: Double
    var targetValue: Int
    var score: Double {
        computeScore()
    }

    private func computeScore() -> Double {
        let difference = abs(targetValue - lround(currentValue))
        return Double( 100 - difference ) / 100
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.sizeToFit()
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.minimumTrackTintColor = CustomColors().deepTurquois
        slider.maximumTrackTintColor = CustomColors().pastelTurquois
        slider.value = Float(currentValue)
        slider.thumbTintColor = UIColor.white.withAlphaComponent(CGFloat(score))
        
        slider.addTarget(
          context.coordinator,
          action: #selector(Coordinator.valueChanged(_:)),
          for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor.white.withAlphaComponent(CGFloat(score))
    }
    
    func makeCoordinator() -> SliderKit.Coordinator {
      Coordinator(value: $currentValue)
    }
}

struct SliderKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderKit(currentValue: .constant(50), targetValue: 50)
    }
}

extension SliderKit {
    
    class Coordinator: NSObject {
      var value: Binding<Double>
      init(value: Binding<Double>) {
        self.value = value
      }

      @objc func valueChanged(_ sender: UISlider) {
        self.value.wrappedValue = Double(sender.value)
      }
    }
}
