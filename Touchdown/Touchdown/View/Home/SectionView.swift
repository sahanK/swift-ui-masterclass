//
//  SectionView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct SectionView: View {
  // MARK: - Properties
  
  let rotateColckwise: Bool
  
  // MARK: - Body
  
  var body: some View {
    VStack(spacing: 0) {
      Spacer()
      Text("Categories".uppercased())
        .font(.footnote)
        .fontWeight(.bold)
        .foregroundColor(.white)
        .rotationEffect(Angle(degrees: rotateColckwise ? 90 : -90))
      Spacer()
    }//: VSTACK
    .background(colorGray.cornerRadius(12))
    .frame(width: 85)
  }//: BODY
}

// MARK: - Preview

struct SectionView_Previews: PreviewProvider {
  static var previews: some View {
    SectionView(rotateColckwise: false)
      .previewLayout(.fixed(width: 120, height: 240))
      .padding()
      .background(colorBackground)
  }
}
