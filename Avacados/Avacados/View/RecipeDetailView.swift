//
//  RecipeDetailView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-28.
//

import SwiftUI

struct RecipeDetailView: View {
  // MARK: - PROPERTIES
  
  let recipe: Recipe
  
  @State private var pulsate: Bool = false
  @Environment(\.presentationMode) var presentationMode
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 0) {
        //IMAGE
        Image(recipe.image)
          .resizable()
          .scaledToFit()
        
        Group {
          // TITLE
          Text(recipe.title)
            .font(.system(.largeTitle, design: .serif))
            .fontWeight(.bold)
            .foregroundColor(Color("ColorGreenAdaptive"))
            .multilineTextAlignment(.center)
            .padding(.top, 10)
          
          // RATING
          RecipeRatingView(recipe: recipe)
          
          // COOKING
          RecipeCookingView(recipe: recipe)
          
          // INGREDIENTS
          Text("Ingredients")
            .fontWeight(.bold)
            .modifier(TitleModifier())
          
         
          VStack(alignment: .leading, spacing: 5) {
            ForEach(recipe.ingredients, id: \.self) { item in
              VStack(alignment: .leading, spacing: 5) {
                Text(item)
                  .font(.footnote)
                  .multilineTextAlignment(.leading)
                Divider()
              }
            }
          }
          
          // INSTRUCTIONS
          Text("Instructions")
            .fontWeight(.bold)
            .modifier(TitleModifier())
          
          ForEach(recipe.instructions, id: \.self) { item in
            VStack {
              Image(systemName: "chevron.down.circle")
                .resizable()
                .frame(width: 42, height: 42, alignment: .center)
                .imageScale(.large)
                .font(Font.title.weight(.ultraLight))
                .foregroundColor(Color("ColorGreenAdaptive"))
              
              Text(item)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .font(.system(.body, design: .serif))
                .frame(minHeight: 100)
            }
          }
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
      }//: VSTACK
    }//: SCROLL
    .edgesIgnoringSafeArea(.top)
    .overlay(
      HStack {
        Spacer()
        VStack {
          Button(action: {
            presentationMode.wrappedValue.dismiss()
          }) {
            Image(systemName: "chevron.down.circle.fill")
              .font(.title)
              .foregroundColor(.white)
              .shadow(radius: 4 )
              .opacity(pulsate ? 1 : 0.6)
              .scaleEffect(pulsate ? 1 : 0.8)
          }
          .padding()
          Spacer()
        }
      }
    )
    .onAppear {
      withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
        pulsate.toggle()
      }
    }
  }//: BODY
}

// MARK: - PREVIEW

struct RecipeDetailView_Previews: PreviewProvider {
  static var previews: some View {
    RecipeDetailView(recipe: recipeData[0])
  }
}
