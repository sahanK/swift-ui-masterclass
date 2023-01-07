//
//  TitleView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct TitleView: View {
  // MARK: - Properties
  
  let title: String
  
  // MARK: - Body
  
  var body: some View {
    HStack {
      Text(title)
        .font(.largeTitle)
        .fontWeight(.heavy)
      Spacer()
    }//: HSTACK
    .padding(.horizontal)
    .padding(.top, 15)
    .padding(.bottom, 10)
  }//: BODY
}

// MARK: - Preview

struct TitleView_Previews: PreviewProvider {
  static var previews: some View {
    TitleView(title: "Helmet")
      .previewLayout(.sizeThatFits)
  }
}
