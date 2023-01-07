//
//  Shop.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import Foundation

// The View will reload when ObservableObject changes
// @Published tell swift if any changes will reload view
class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? = nil
}
