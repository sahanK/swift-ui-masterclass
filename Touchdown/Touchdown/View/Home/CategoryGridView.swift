//
//  CategoryGridView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct CategoryGridView: View {
  // MARK: - Properties
  
  // MARK: - Body
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      LazyHGrid(rows: gridLayout, alignment: .center, spacing: columnSpacing, pinnedViews: []) {
        Section(
          header: SectionView(rotateColckwise: false),
          footer: SectionView(rotateColckwise: true)
        ) {
          ForEach(categories) { category in
            CategoryItemView(category: category)
          }
        }//: LOOP
      }//: HGRID
      .frame(height: 140)
      .padding(.horizontal, 15)
      .padding(.vertical, 10)
    }//: SCROLL
  }//: BODY
}

// MARK: - Preview

struct CategoryGridView_Previews: PreviewProvider {
  static var previews: some View {
      CategoryGridView()
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
