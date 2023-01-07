//
//  OnBoardingView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-30.
//

import SwiftUI

struct OnBoardingView: View {
  // MARK: - Properties
  
  var fruites: [Fruit] = fruitesData
  
  // MARK: - Body
  
    var body: some View {
      TabView {
        ForEach(fruites[0...5]) { fruit in
          FruitCardView(fruit: fruit)
        }
      }//: TABVIEW
      .tabViewStyle(PageTabViewStyle())
      .padding(.vertical, 20)
    }//: BODY
}

// MARK: - Preview

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(fruites: fruitesData)
    }
}
