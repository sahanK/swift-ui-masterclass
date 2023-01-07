//
//  CardView.swift
//  Honeymoon
//
//  Created by Sahan Walpita on 2023-01-02.
//

import SwiftUI

struct CardView: View, Identifiable {
  // MARK: - PROPERTIES
  let id = UUID()
  var honeymoon: Destination
  
  // MARK: - BODY
  
  var body: some View {
    Image(honeymoon.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(24)
      .frame(minWidth: 0, maxWidth: .infinity)
      .overlay(
        VStack(alignment: .center, spacing: 12) {
          Text(honeymoon.place.uppercased())
            .foregroundColor(.white)
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 1)
            .padding(.horizontal, 18)
            .padding(.bottom, 8)
            .overlay(
              Rectangle()
                .fill(.white)
                .frame(height: 1),
              alignment: .bottom
            )
          Text(honeymoon.country.uppercased())
            .foregroundColor(.black)
            .font(.footnote)
            .fontWeight(.bold)
            .frame(minWidth: 85)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
              Capsule().fill(.white)
            )
        }
        .frame(minWidth: 280)
        .padding(.bottom, 50),
        alignment: .bottom
      )
  }
}

// MARK: - PREVIEW

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    CardView(honeymoon: honeymoonData[0])
      .previewLayout(.fixed(width: 375, height: 600))
  }
}
