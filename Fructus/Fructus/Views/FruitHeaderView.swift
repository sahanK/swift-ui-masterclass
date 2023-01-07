//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-31.
//

import SwiftUI

struct FruitHeaderView: View {
  // MARK: - Properties
  
  @State private var isAnimatingImage: Bool = false
  
  var fruit: Fruit
  
  // MARK: - Body
  
    var body: some View {
      ZStack {
        LinearGradient(colors: fruit.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing)
        
        Image(fruit.image)
          .resizable()
          .scaledToFit()
          .shadow(color: .black.opacity(0.15), radius: 8, x: 6, y: 8)
          .padding(.vertical, 20)
          .scaleEffect(isAnimatingImage ? 1 : 0.5)
          
      }//: ZSTACK
      .frame(height: 440)
      .onAppear {
        withAnimation(.easeOut(duration: 0.5)) {
          isAnimatingImage = true
        }
      }
    }
}

// MARK: - Preview

struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
      FruitHeaderView(fruit: fruitesData[0])
        .previewLayout(.fixed(width: 375, height: 440))
    }
}
