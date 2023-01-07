//
//  CheckBoxStyle.swift
//  Devote
//
//  Created by Sahan Walpita on 2022-09-14.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    return HStack {
      Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
        .foregroundColor(configuration.isOn ? .pink : .primary)
        .font(.system(size: 30, weight: .semibold, design: .rounded))
        .onTapGesture {
          configuration.isOn.toggle()
          
          if configuration.isOn {
            playSound(sound: "sound-rise", type: "mp3")
          } else {
            playSound(sound: "sound-tap", type: "mp3")
          }
        }
      configuration.label
    }//: HSTACK
  }
}

struct CheckBoxStyle_Previews: PreviewProvider {
  static var previews: some View {
    Toggle("Placeholder label", isOn: .constant(true))
      .toggleStyle(CheckBoxStyle())
      .padding()
      .previewLayout(.sizeThatFits)
  }
}
