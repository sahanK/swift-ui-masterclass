//
//  StartButtonView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-30.
//

import SwiftUI

struct StartButtonView: View {
  // MARK: - Properties
  
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
  // MARK: - Body
    var body: some View {
      Button {
        withAnimation {
          isOnboarding = false
        }
      } label: {
        HStack(spacing: 20) {
          Text("Start")
          Image(systemName: "arrow.right.circle")
            .imageScale(.large)
        }//: HSTACK
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
          Capsule().strokeBorder(.white, lineWidth: 1.25)
        )
      }//: BUTTON
      .accentColor(.white)
    }//: BODY
}

// MARK: - Preview
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
      StartButtonView()
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
}
