//
//  ProductModel.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import Foundation

struct Product: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
  let price: Int
  let description: String
  let color: [Double]
  
  // Computed properties
  var red: Double { return color[0] }
  var green: Double { return color[1] }
  var blue: Double { return color[2] }
  
  var formattedPrice: String {
    return "$\(price)"
  }
}
