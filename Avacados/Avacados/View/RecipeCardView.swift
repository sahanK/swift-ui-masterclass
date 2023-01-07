//
//  RecipeView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-28.
//

import SwiftUI

struct RecipeCardView: View {
  // MARK: - PROPERTIES
  
  let recipe: Recipe
  let hapticFeedback = UIImpactFeedbackGenerator(style: .heavy)
  
  @State private var isPresentingModel: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      // CARD IMAGE
      Image(recipe.image)
        .resizable()
        .scaledToFit()
        .overlay(
          HStack {
            Spacer()
            VStack {
              Image(systemName: "bookmark")
                .font(Font.title.weight(.light))
                .foregroundColor(.white)
                .imageScale(.small)
              .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
              .padding()
              Spacer()
            }//: VSTACK
          }//: HSTACK
        )//: IMAGE
      
      VStack(alignment: .leading, spacing: 12) {
        // TITLE
        Text(recipe.title)
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
          .foregroundColor(Color("ColorGreenMedium"))
          .lineLimit(1)
        
        //HEADLINE
        Text(recipe.headline)
          .font(.system(.body, design: .serif))
          .foregroundColor(.gray)
          .italic()
        
        // RATES
        RecipeRatingView(recipe: recipe)
        
        // COOKING
        RecipeCookingView(recipe: recipe)
      }
      .padding()
      .padding(.bottom, 12)
    }//: VSTACK
    .background(.white)
    .cornerRadius(12)
    .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
    .onTapGesture {
      hapticFeedback.impactOccurred()
      isPresentingModel.toggle()
    }
    .sheet(isPresented: $isPresentingModel) {
      RecipeDetailView(recipe: recipe)
    }
  }//: BODY
}

// MARK: - PREVIEW

struct RecipeCardView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeCardView(recipe: recipeData[0])
      .previewLayout(.sizeThatFits)
  }
}
