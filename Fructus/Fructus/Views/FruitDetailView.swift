//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-31.
//

import SwiftUI

struct FruitDetailView: View {
  // MARK: - Properties
  var fruit: Fruit
  // MARK: - Body
  
    var body: some View {
      NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(alignment: .center, spacing: 20) {
            // HEADER
            FruitHeaderView(fruit: fruit)
            
            VStack(alignment: .leading, spacing: 20) {
              // TITLE
              Text(fruit.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(fruit.gradientColors[1])
              
              // HEADLINE
              Text(fruit.headline)
                .font(.headline)
                .multilineTextAlignment(.leading)
              
              // NUTRIENTS
              FruitesNutrientsView(fruit: fruit)
              
              // SUBHEADLINE
              Text("Learn more about \(fruit.title)".uppercased())
                .fontWeight(.bold)
                .foregroundColor(fruit.gradientColors[1])
              
              // DESCRIPTION
              Text(fruit.description)
                .multilineTextAlignment(.leading)
              
              // LINK
              SourceLinkView()
                .padding(.top, 10)
                .padding(.bottom, 40)
              
            }//: VSTACK
            .padding(.horizontal, 20)
            .frame(maxWidth: 640, alignment: .center)
          }//: VSTACK
          .navigationBarTitle(fruit.title, displayMode: .inline)
          .navigationBarHidden(true)
        }//: SCROLL
        .edgesIgnoringSafeArea(.top)
      }//: NAVIGATION
      .navigationViewStyle(StackNavigationViewStyle())
    }//: BODY
}

// MARK: - Preview

struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitesData[0])
    }
}
