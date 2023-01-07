//
//  RipeningModel.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-29.
//

import SwiftUI

struct Ripening: Identifiable {
  var id = UUID()
  var image: String
  var stage: String
  var title: String
  var description: String
  var ripeness: String
  var instruction: String
}
