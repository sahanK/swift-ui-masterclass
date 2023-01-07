//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct ProductDetailView: View {
  // MARK: - Properties
  
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      // NAVBAR
      NavigationbarDetailView()
        .padding(.horizontal)
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
      // HEADER
      HeaderDetailView()
        .padding(.horizontal)
      // DETAIL TOP PART
      TopPartDetailView()
        .padding(.horizontal)
        .zIndex(1)
      // DETAIL BOTTOM PART
      VStack(alignment: .center, spacing: 0) {
        // RATINGS + SIZES
        RatingsSizesDetailView()
          .padding(.top, -20)
          .padding(.bottom, 10)
        // DESCRIPTION
        ScrollView(.vertical, showsIndicators: false) {
          Text(shop.selectedProduct?.description ??  sampleProduct.description)
            .font(.system(.body, design: .rounded))
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
        }//: SCROLL
        
        // QUANTITY + FAVOURITE
        QuantityFavouriteDetailView()
          .padding(.vertical, 10)
        
        // ADD TO CART
        AddToCartDetailView()
          .padding(.bottom, 20)
      }//: VSTACK
      .padding(.horizontal, 20)
      .background(
        Color.white.clipShape(CustomShape())
          .padding(.top, -105)
      )
    }//: VSTACK
    .zIndex(0)
    .ignoresSafeArea(.all, edges: .all)
    .background(
      Color(
        red: shop.selectedProduct?.red ?? sampleProduct.red,
        green: shop.selectedProduct?.green ?? sampleProduct.green,
        blue: shop.selectedProduct?.blue ?? sampleProduct.blue
      ).ignoresSafeArea(.all, edges: .all)
    )
  }//: BODY
}

// MARK: - Preview

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailView()
      .environmentObject(Shop())
  }
}
