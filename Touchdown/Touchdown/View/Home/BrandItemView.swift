//
//  BrandItemView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct BrandItemView: View {
  // MARK: - Properties
  
  let brand: Brand
  
  // MARK: - Body
  
  var body: some View {
    Image(brand.image)
      .resizable()
      .scaledToFit()
      .padding(3)
      .background(Color.white.cornerRadius(12))
      .background(
        RoundedRectangle(cornerRadius: 12).stroke(.gray, lineWidth: 1)
      )
  }//: BODY
}

// MARK: - Preview

struct BrandItemView_Previews: PreviewProvider {
  static var previews: some View {
    BrandItemView(brand: brands[0])
      .previewLayout(.sizeThatFits)
      .padding()
      .background(colorBackground)
  }
}
