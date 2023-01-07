//
//  CreditsView.swift
//  Africa
//
//  Created by Sahan Walpita on 2022-09-08.
//

import SwiftUI

struct CreditsView: View {
  var body: some View {
    VStack {
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)
      Text("""
  Copyright © Sahan Kaushalya
  All rights received
  Better apps ♡ less code
""")
        .font(.footnote)
        .multilineTextAlignment(.center)
        .opacity(0.4)
    }//: VSTACK
  }//: BODY
}

struct CreditsView_Previews: PreviewProvider {
  static var previews: some View {
      CreditsView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
