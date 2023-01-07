//
//  FruitCardView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-30.
//

import SwiftUI

struct FruitCardView: View {
  // MARK: - Properties
  @State private var isAnimating: Bool = false
  
  var fruit: Fruit
  
  // MARK: - Body
  
    var body: some View {
      ZStack {
        VStack(spacing: 20) {
          // FRUIT - IMAGE
          Image(fruit.image)
            .resizable()
            .scaledToFit()
            .shadow(color: .black.opacity(0.2), radius: 8, x: 6, y: 8)
            .scaleEffect(isAnimating ? 1 : 0.5)
          // FRUIT - TITLE
          Text(fruit.title)
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.heavy)
            .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 2)
          // FRUIT - HEADLINE
          Text(fruit.headline)
            .foregroundColor(.white)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
            .frame(maxWidth: 480)
          // BUTTON - START
          StartButtonView()
        }//: VSTACK
      }//: ZSTACK
      .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
      .background(.linearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom))
      .cornerRadius(20)
      .padding(.horizontal, 20)
      .onAppear {
        withAnimation(.easeOut(duration: 0.5)) {
          isAnimating = true
        }
      }
    }//: BODY
}

// MARK: - Preview

struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
      FruitCardView(fruit: fruitesData[1])
        .previewLayout(.fixed(width: 340, height: 640))
    }
}
