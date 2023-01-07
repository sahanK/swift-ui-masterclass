//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct BrandGridView: View {
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
        ForEach(brands) { brand in
          BrandItemView(brand: brand)
        }//: LOOP
      }//: HGRID
      .frame(height: 200)
      .padding(15)
    }//: SCROLL
  }//: BODY
}

struct BrandGridView_Previews: PreviewProvider {
  static var previews: some View {
      BrandGridView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
