//
//  ContentView.swift
//  Developers
//
//  Created by Sahan Walpita on 2022-09-18.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  let cards: [Card] = cardData
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 20) {
        ForEach(cards) { item in
          CardView(card: item)
        }
      }
      .padding(20)
    }//: SCROLL
  }//: BODY
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
