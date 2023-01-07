//
//  CategoryItemView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct CategoryItemView: View {
  // MARK: - Properties
  let category: Category
  // MARK: - Body
  
  var body: some View {
    Button(action: {
      print("")
    }) {
      HStack(spacing: 10) {
        Image(category.image)
          .renderingMode(.template)
          .resizable()
          .scaledToFill()
          .frame(width: 30, height: 30, alignment: .center)
          .foregroundColor(.gray)
        Text(category.name.uppercased())
          .fontWeight(.light)
          .foregroundColor(.gray)
        Spacer()
      }//: HSTACK
      .padding()
      .background(.white)
      .cornerRadius(12)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .stroke(.gray, lineWidth: 1)
      )
    }//: BUTTON
  }//: BODY
}

// MARK: - Preview

struct CategoryItemView_Previews: PreviewProvider {
  static var previews: some View {
    CategoryItemView(category: categories[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
