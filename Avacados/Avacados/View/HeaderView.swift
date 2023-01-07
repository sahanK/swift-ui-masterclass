//
//  HeaderView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-23.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - PROPERTIES
  
  let header: Header
  
  @State private var showHeadline: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    ZStack {
      Image(header.image)
        .resizable()
        .scaledToFit()
      HStack(alignment: .top, spacing: 0) {
        Rectangle()
          .fill(Color("ColorGreenLight"))
          .frame(width: 4)
        VStack(alignment: .leading, spacing: 6) {
          Text(header.headline)
            .font(.system(.title, design: .serif))
            .foregroundColor(.white)
            .fontWeight(.bold)
            .shadow(radius: 3)
          
          Text(header.subheadline)
            .font(.footnote)
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)
            .shadow(radius: 3)
            .lineLimit(2)
        }//: VSTACK
        .padding(.vertical, 0)
        .padding(.horizontal, 20)
        .frame(width: 281, height: 105)
        .background(Color("ColorBlackTransparentLight"))
      }//: HSTACK
      .frame(width: 285, height: 105, alignment: .center)
      .offset(x: -66, y: showHeadline ? 75 : 220)
      .onAppear {
        withAnimation(.spring(
          response: 1.5,
          dampingFraction: 0.5,
          blendDuration: 0.5
        ).speed(1)
        ) {
          showHeadline.toggle()
        }
      }
    }//: ZSTACK
    .frame(width: .infinity, height: .infinity, alignment: .center)
  }//: BODY
}

// MARK: - PREVIEW

struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(header: headersData[0])
      .previewLayout(.sizeThatFits)
  }
}
