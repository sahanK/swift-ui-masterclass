//
//  BlankView.swift
//  Devote
//
//  Created by Sahan Walpita on 2022-09-13.
//

import SwiftUI

struct BlankView: View {
  // MARK: - PROPERTIES
  
  var backgroundColor: Color
  var backgroundOpacity: Double
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Spacer()
    }//: VSTACK
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(backgroundColor.opacity(backgroundOpacity))
    .blendMode(.overlay)
    .edgesIgnoringSafeArea(.all)
  }//: BO DY
}

// MARK: - PREVIEW

struct BlankView_Previews: PreviewProvider {
  static var previews: some View {
    BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
      .background(BackgroundImageView())
      .background(backgroundGradient.ignoresSafeArea(.all))
  }
}
