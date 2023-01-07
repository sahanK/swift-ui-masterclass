//
//  RatingsSizesDetailView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct RatingsSizesDetailView: View {
  // MARK: - Properties
  
  let sizes: [String] = ["XS", "S", "M", "L", "XL"]
  
  // MARK: - Body
  
  var body: some View {
    HStack(alignment: .top, spacing: 3) {
      // RATINGS
      VStack(alignment: .leading, spacing: 3) {
        Text("Ratings")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(colorGray)
        
        HStack(alignment: .center, spacing: 3) {
          ForEach(1...5, id: \.self) { item in
            Button(action: {}) {
              Image(systemName: "star.fill")
                .frame(width: 28, height: 28, alignment: .center)
                .background(colorGray.cornerRadius(5))
                .foregroundColor(.white)
            }//: BUTTON
          }//: LOOP
        }//: HSTACK
      }//: VSTACK
      
      Spacer()
      
      // SIZES
      VStack(alignment: .trailing, spacing: 3) {
        Text("Sizes")
          .font(.footnote)
          .fontWeight(.semibold)
          .foregroundColor(colorGray)
        HStack(alignment: .center, spacing: 5) {
          ForEach(sizes, id: \.self) { size in
            Button(action: {}) {
              Text(size)
                .font(.footnote)
                .fontWeight(.black)
                .foregroundColor(.gray)
                .frame(width: 28, height: 28, alignment: .center)
                .background(Color.white.cornerRadius(5))
                .background(
                  RoundedRectangle(cornerRadius: 5)
                    .stroke(colorGray, lineWidth: 1)
                )
            }//: BUTTON
          }//: LOOP
        }//: HSTACK
      }//: VSTACK
    }//: HSTACK
  }//: BODY
}

// MARK: - Preview

struct RatingsSizesDetailView_Previews: PreviewProvider {
  static var previews: some View {
    RatingsSizesDetailView()
    .previewLayout(.sizeThatFits)
    .padding()
  }
}
