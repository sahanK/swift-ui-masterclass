//
//  TopPartDetailView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct TopPartDetailView: View {
  // MARK: - Properties
  
  @EnvironmentObject var shop: Shop
  @State private var isAnimated: Bool = false
  
  // MARK: - Body
  
  var body: some View {
    HStack(alignment: .center, spacing: 8) {
      VStack(alignment: .leading, spacing: 8) {
        Text("Price")
          .fontWeight(.semibold)
        Text(shop.selectedProduct?.formattedPrice ?? sampleProduct.formattedPrice)
          .font(.largeTitle)
          .fontWeight(.black)
          .scaleEffect(1.35, anchor: .leading)
      }
      .offset(x: 0, y: isAnimated ? -50 : -75)
      Spacer()
      Image(shop.selectedProduct?.image ?? sampleProduct.image)
        .resizable()
        .scaledToFit()
        .offset(x: 0, y: isAnimated ? 0 : -35)
    }//: HSTACK
    .onAppear {
      withAnimation(.easeOut(duration: 0.75)) {
        isAnimated = true
      }
    }
  }
}

// MARK: - Preview

struct TopPartDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TopPartDetailView()
      .environmentObject(Shop())
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
