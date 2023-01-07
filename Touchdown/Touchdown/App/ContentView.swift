//
//  ContentView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  
  var body: some View {
    VStack {
      if shop.showingProduct == false && shop.selectedProduct == nil {
        VStack(spacing: 0) {
        NavigationBarView()
          .padding()
          .background(.white)
          .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
        
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 20) {
            // MARK: - FEATURED
            FeaturedTabView()
              .frame(minHeight: 256)
            
            // MARK: - CATEGORIES
            CategoryGridView()
            
            // MARK: - PRODUCTS
            TitleView(title: "Helmets")
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: rowSpacing, pinnedViews: []) {
              ForEach(products) { product in
                ProductItemView(product: product)
                  .onTapGesture {
                    hapticFeedback.impactOccurred()
                    withAnimation(.easeOut) {
                      shop.selectedProduct = product
                      shop.showingProduct = true
                    }
                  }
              }//: LOOP
            }//: HGRID
            .padding(.horizontal)
            
            // MARK: - BRANDS
            TitleView(title: "Brands")
            BrandGridView()
            
            // MARK: - FOOTER
            FooterView()
              .padding(.horizontal)
          }//: VSTACK
        }//: SCROLL
      }//: VSTACK
        .background(colorBackground.ignoresSafeArea(.all, edges: .all))
      } else {
        ProductDetailView()
      }
    }
  }//: BODY
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
        .environmentObject(Shop())
    }
  }
}
