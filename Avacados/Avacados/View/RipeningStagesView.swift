//
//  RipeningStagesView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-19.
//

import SwiftUI

struct RipeningStagesView: View {
  // MARK: - PROPERTIES
  
  let ripeningStages: [Ripening] = ripeningData
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      VStack {
        Spacer()
        HStack(alignment: .center, spacing: 25) {
          ForEach(ripeningStages) { item in
            RipeningView(ripening: item)
          }//: LOOP
        }//: HSTACK
        .padding(.vertical)
        .padding(.horizontal, 25)
        Spacer()
      }//: VSTACK
    }//: SCROLL
    .edgesIgnoringSafeArea(.all)
  }//: BODY
}

// MARK: - PREVIEW

struct RipeningStagesView_Previews: PreviewProvider {
  static var previews: some View {
    RipeningStagesView()
  }
}
