//
//  FormRowStaticView.swift
//  Todo App
//
//  Created by Sahan Walpita on 2022-12-26.
//

import SwiftUI

struct FormRowStaticView: View {
  // MARK: - PROPERTIES
  
  var icon: String
  var firstText: String
  var secondText: String
  
  // MARK: - BODY
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(.gray)
        Image(systemName: icon)
          .foregroundColor(.white)
      }
      .frame(width: 36, height: 36, alignment: .center)
      Text(firstText)
        .foregroundColor(.gray)
      Spacer()
      Text(secondText)
    }
  }
}

// MARK: - PREVIEW
struct FormRowStaticView_Previews: PreviewProvider {
  static var previews: some View {
    FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
  }
}
