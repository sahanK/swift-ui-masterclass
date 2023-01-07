//
//  ControlImageView.swift
//  Pinch
//
//  Created by Sahan Kaushalya on 2022-08-30.
//

import SwiftUI

struct ControlImageView: View {
  let icon: String
  
    var body: some View {
      Image(systemName: icon)
        .font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
      ControlImageView(icon: "minus.magnifyingglass")
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
