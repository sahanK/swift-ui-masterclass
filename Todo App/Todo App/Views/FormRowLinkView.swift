//
//  FormRowLinkView.swift
//  Todo App
//
//  Created by Sahan Walpita on 2022-12-26.
//

import SwiftUI

struct FormRowLinkView: View {
  // MARK: - PROPERTIES
  
  var icon: String
  var color: Color
  var text: String
  var link: String
  
  // MARK: - BODY
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(color)
        Image(systemName: icon)
          .imageScale(.large)
          .foregroundColor(.white)
      }
      .frame(width: 36, height: 36, alignment: .center)
      Text(text)
        .foregroundColor(.gray)
      Spacer()
      Link(destination: URL(string: link)!, label: {
        Image(systemName: "chevron.right")
          .font(.system(size: 14, weight: .semibold, design: .rounded))
          .foregroundColor(Color(.systemGray2))
      })
    }
  }
}

// MARK: - PREVIEW
struct FormRowLinkView_Previews: PreviewProvider {
  static var previews: some View {
    FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://swiftuimasterclass.com")
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
  }
}
