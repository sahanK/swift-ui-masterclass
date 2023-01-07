//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct AddToCartDetailView: View {
  // MARK: - Properties
  
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  
  var body: some View {
    Button(action: {
      hapticFeedback.impactOccurred()
    }) {
      Spacer()
      Text("Add to cart".uppercased())
        .font(.system(.title2, design: .rounded))
        .fontWeight(.bold)
        .foregroundColor(.white)
      Spacer()
    }//: BUTTON
    .padding(15)
    .background(
      Color(
        red: shop.selectedProduct?.red ?? sampleProduct.red,
        green: shop.selectedProduct?.green ?? sampleProduct.green,
        blue: shop.selectedProduct?.blue ?? sampleProduct.blue
      )
    )
    .clipShape(Capsule())
  }//: BODY
}

// MARK: - Preview

struct AddToCartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AddToCartDetailView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
