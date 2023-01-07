//
//  RecipeRatingView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-28.
//

import SwiftUI

struct RecipeRatingView: View {
  // MARK: - PROPERTIES
  
  var recipe: Recipe
  
  // MARK: - BODY
  
  var body: some View {
    HStack(alignment: .center, spacing: 5) {
      ForEach(1...(recipe.rating), id: \.self) { _ in
        Image(systemName: "star.fill")
          .font(.body)
        .foregroundColor(.yellow)
      }//: LOOP
    }//: HSTACK
  }//: BODY
}

// MARK: - PREVIEW

struct RecipeRatingView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeRatingView(recipe: recipeData[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
