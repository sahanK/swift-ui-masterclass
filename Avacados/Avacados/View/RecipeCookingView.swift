//
//  RecipeCookingView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-28.
//

import SwiftUI

struct RecipeCookingView: View {
  // MARK: - PROPERTIES
  
  let recipe: Recipe
  
  // MARK: - BODY
  
  var body: some View {
    HStack(alignment: .center, spacing: 12) {
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "person.2")
        Text("Serves: \(recipe.serves)")
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "clock")
        Text("Prep: \(recipe.preparation)")
      }
      HStack(alignment: .center, spacing: 2) {
        Image(systemName: "flame")
        Text("Cooking: \(recipe.cooking)")
      }
    }
    .font(.footnote)
    .foregroundColor(.gray)
  }
}

// MARK: - PREVIEW

struct RecipeCookingView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeCookingView(recipe: recipeData[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
