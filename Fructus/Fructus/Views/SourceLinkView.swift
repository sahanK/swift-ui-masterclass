//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-31.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
      GroupBox {
        HStack {
          Text("Content source")
          Spacer()
          Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
          Image(systemName: "arrow.up.right.square")
            .font(.footnote)
        }//: HSTACK
      }//: GROUP
    }//: BODY
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
