//
//  CardView.swift
//  Developers
//
//  Created by Sahan Walpita on 2022-09-18.
//

import SwiftUI

struct CardView: View {
  // MARK: - PROPERTIES
  var card: Card
  
  @State private var fadeIn: Bool = false
  @State private var moveDownward: Bool = false
  @State private var moveUpward: Bool = false
  @State private var showAlert: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Image(card.imageName)
        .opacity(fadeIn ? 1.0 : 0.0)
      
      VStack {
        Text(card.title)
          .font(.system(.largeTitle, design: .rounded))
          .foregroundColor(.white)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
        Text(card.headline)
          .foregroundColor(.white)
          .fontWeight(.light)
          .italic()
      }//: VSTACK
      .offset(y: moveDownward ? -218 : -300)
      
      Button(action: {
        playSound(sound: "sound-chime", type: "mp3")
        hapticFeedback.impactOccurred()
        showAlert.toggle()
      }) {
        HStack {
          Text(card.callToAction.uppercased())
            .foregroundColor(.white)
            .fontWeight(.heavy)
          Image(systemName: "arrow.right.circle")
            .font(.title.weight(.medium))
            .foregroundColor(.white)
        }//: HSTACK
        .padding(.vertical)
        .padding(.horizontal, 24)
        .background(
          LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing)
        )
        .clipShape(Capsule())
        .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
      }//: BUTTON
      .offset(y: moveUpward ? 210 : 300)
    }//: ZSTACK
    .frame(width: 335, height: 545)
    .background(
      LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom)
    )
    .cornerRadius(16)
    .shadow(radius: 8)
    .onAppear {
      withAnimation(.linear(duration: 1)) {
        fadeIn = true
      }
      withAnimation(.linear(duration: 0.8)) {
        moveDownward.toggle()
        moveUpward.toggle()
      }
    }
    .alert(isPresented: $showAlert) {
      Alert(
        title: Text(card.title),
        message: Text(card.message),
        dismissButton: .default(Text("OK"))
      )
    }
  }//: BODY
}

// MARK: - PREVIEW

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(card: cardData[0])
      .previewLayout(.sizeThatFits)
  }
}
