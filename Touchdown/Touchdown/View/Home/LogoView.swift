//
//  LogoView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
      HStack {
        Text("touch".uppercased())
          .font(.title3)
          .fontWeight(.black)
          .foregroundColor(.black)
        Image("logo-dark")
          .resizable()
          .scaledToFit()
          .frame(width: 35, height: 35, alignment: .center)
        Text("down".uppercased())
          .font(.title3)
          .fontWeight(.black)
          .foregroundColor(.black)
      }//: HSTACK
    }//: BODY
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
