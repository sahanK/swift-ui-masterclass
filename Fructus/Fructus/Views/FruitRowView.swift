//
//  FruitRowView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-31.
//

import SwiftUI

struct FruitRowView: View {
  // MARK: - Properties
  var fruit: Fruit
  
  // MARK: - Body
  
    var body: some View {
      HStack {
        Image(fruit.image)
          .renderingMode(.original)
          .resizable()
          .scaledToFit()
          .frame(width: 80, height: 80, alignment: .center)
          .shadow(color: .black.opacity(0.2), radius: 8, x: 6, y: 8)
          .background(.linearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom))
          .cornerRadius(8)
        VStack(alignment: .leading, spacing: 5) {
          Text(fruit.title)
            .font(.title2)
            .fontWeight(.bold)
          Text(fruit.headline)
            .font(.caption)
            .foregroundColor(.secondary)
            .fontWeight(.bold)
        }//: VSTACK
      }//: HSTACK
    }//: BODY
}

// MARK: - Preview

struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
      FruitRowView(fruit: fruitesData[0])
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
