 //
//  QuantityFavouriteDetailView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct QuantityFavouriteDetailView: View {
  // MARK: - Properties
  
  @State private var counter: Int = 0
  
  // MARK: - Body
  
  var body: some View {
    HStack {
      Button(action: {
        if counter > 0 {
          hapticFeedback.impactOccurred()
          counter -= 1
        }
      }) {
        Image(systemName: "minus.circle")
      }
      
      Text("\(counter)")
        .frame(minWidth: 35)
      
      Button(action: {
        if counter < 100 {
          hapticFeedback.impactOccurred()
          counter += 1
        }
      }) {
        Image(systemName: "plus.circle")
      }
      
      Spacer()
      
      Button(action: {
        hapticFeedback.impactOccurred()
      }) {
        Image(systemName: "heart.circle")
          .foregroundColor(.pink)
      }
    }//: HSTACK
    .font(.system(.title, design: .rounded))
    .foregroundColor(.black)
    .imageScale(.large)
  }//: BODY
}

// MARK: - Preview

struct QuantityFavouriteDetailView_Previews: PreviewProvider {
  static var previews: some View {
    QuantityFavouriteDetailView()
    .previewLayout(.sizeThatFits)
    .padding()
  }
}
