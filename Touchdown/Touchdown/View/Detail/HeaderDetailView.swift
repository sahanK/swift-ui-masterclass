//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct HeaderDetailView: View {
  // MARK: - Properties
  
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  
  var body: some View {
    VStack(alignment: .leading, spacing: 6) {
      Text("Protective gear")
      Text(shop.selectedProduct?.name ?? sampleProduct.name)
        .font(.largeTitle)
        .fontWeight(.black)
    }//: VSTACK
    .foregroundColor(.white)
  }//: BODY
}

// MARK: - Preview

struct HeaderDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderDetailView()
      .environmentObject(Shop())
    .previewLayout(.sizeThatFits)
    .padding()
    .background(.gray)
  }
}
