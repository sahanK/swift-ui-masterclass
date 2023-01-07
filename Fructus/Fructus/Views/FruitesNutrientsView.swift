//
//  FruitesNutrientsView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-31.
//

import SwiftUI

struct FruitesNutrientsView: View {
  // MARK: - Properties
  var fruit: Fruit
  let nutrients: [String] = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
  
  // MARK: - Body
  
    var body: some View {
      GroupBox {
        DisclosureGroup("Nutritional value per 100g") {
          ForEach(0 ..< nutrients.count, id: \.self) { item in
            Divider().padding(.vertical, 2)
            
            HStack {
              Group {
                Image(systemName: "info.circle")
                Text(nutrients[item])
              }
              .foregroundColor(fruit.gradientColors[1])
              .font(.body.weight(.bold))
              
              Spacer(minLength: 25)
              
              Text(fruit.nutrition[item])
                .multilineTextAlignment(.trailing)
            }//: HSTACK
          }//: LOOP
        }//: DISCLOSURE GROUP
      }//: GROUPBOX
    }//: BODY
}

// MARK: - Preview

struct FruitesNutrientsView_Previews: PreviewProvider {
    static var previews: some View {
      FruitesNutrientsView(fruit: fruitesData[0])
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: 375, height: 480))
        .padding()
    }
}
