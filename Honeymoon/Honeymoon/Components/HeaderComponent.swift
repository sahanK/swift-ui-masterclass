//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by Sahan Walpita on 2023-01-03.
//

import SwiftUI

struct HeaderComponent: View {
  var body: some View {
    VStack(alignment: .center, spacing: 20) {
      Capsule()
        .frame(width: 120, height: 6, alignment: .center)
        .foregroundColor(.secondary)
        .opacity(0.2)
      Image("logo-honeymoon")
        .resizable()
        .scaledToFit()
        .frame(height: 28)
    }
  }
}

struct HeaderComponent_Previews: PreviewProvider {
  static var previews: some View {
    HeaderComponent()
      .previewLayout(.fixed(width: 375, height: 128))
  }
}
