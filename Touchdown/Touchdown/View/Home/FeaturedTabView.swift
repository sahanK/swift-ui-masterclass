//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct FeaturedTabView: View {
  var body: some View {
    TabView {
      ForEach(players) { player in
        FeaturedItemView(player: player)
          .padding(.top, 10)
          .padding(.horizontal, 15)
      }//: LOOP
    }//: TABVIEW
    .tabViewStyle(PageTabViewStyle())
  }//: BODY
}

// MARK: - Preview

struct FeaturedTabView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedTabView()
    .background(.gray)
  }
}
