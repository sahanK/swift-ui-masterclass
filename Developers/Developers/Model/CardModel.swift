//
//  CardModel.swift
//  Developers
//
//  Created by Sahan Walpita on 2022-09-18.
//

import SwiftUI

struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}
