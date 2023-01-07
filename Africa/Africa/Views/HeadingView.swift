//
//  HeadingView.swift
//  Africa
//
//  Created by Sahan Kaushalya on 2022-09-03.
//

import SwiftUI

struct HeadingView: View {
  // MARK: - Properties
  
  var headingImage: String
  var headingText: String
  
  // MARK: - Body
  
  var body: some View {
    HStack {
      Image(systemName: headingImage)
        .foregroundColor(.accentColor)
        .imageScale(.large)
      Text(headingText)
        .font(.title3)
        .fontWeight(.bold)
    }//: HSTACK
    .padding(.vertical)
  }//: BODY
}

// MARK: - Preview

struct HeadingView_Previews: PreviewProvider {
  static var previews: some View {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness In Pictures")
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
