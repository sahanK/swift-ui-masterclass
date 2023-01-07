//
//  NavigationbarDetailView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct NavigationbarDetailView: View {
  // MARK: - Properties
  
  @EnvironmentObject var shop: Shop
  
  // MARK: - Body
  
  var body: some View {
    HStack {
      Button(action: {
        hapticFeedback.impactOccurred()
        withAnimation(.easeIn) {
          shop.showingProduct = false
          shop.selectedProduct = nil
        }
      }) {
        Image(systemName: "chevron.left")
          .font(.title)
          .foregroundColor(.white)
      }
      
      Spacer()
      
      Button(action: {
        
      }) {
        Image(systemName: "cart")
          .font(.title)
          .foregroundColor(.white)
      }
    }//: HSTACK
  }//: BODY
}

// MARK: - Preview

struct NavigationbarDetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationbarDetailView()
      .environmentObject(Shop())
    .previewLayout(.sizeThatFits)
    .padding()
    .background(.gray)
  }
}
