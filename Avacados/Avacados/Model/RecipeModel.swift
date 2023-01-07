//
//  RecipeModel.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-28.
//

import SwiftUI

struct Recipe: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var image: String
  var rating: Int
  var serves: Int
  var preparation: Int
  var cooking: Int
  var instructions: [String]
  var ingredients: [String]
}
