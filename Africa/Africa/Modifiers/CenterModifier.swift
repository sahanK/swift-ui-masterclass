//
//  CenterModifier.swift
//  Africa
//
//  Created by Sahan Walpita on 2022-09-08.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}
