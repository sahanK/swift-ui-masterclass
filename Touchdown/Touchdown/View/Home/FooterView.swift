//
//  FooterView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct FooterView: View {
  var body: some View {
    VStack(alignment: .center, spacing: 15) {
      Text("We offer the most cutting edge, comfortable, lightweight and dureable footbal helmets in the market at affordable prices.")
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .layoutPriority(2)
      Image("logo-lineal")
        .renderingMode(.template)
        .foregroundColor(.gray)
        .layoutPriority(0)
      Text("Copyrights © Sahan Kaushalya\nAll rights reserved")
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .layoutPriority(1)
    }//: VSTACK
  }//: BODY
}

struct FooterView_Previews: PreviewProvider {
  static var previews: some View {
      FooterView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
