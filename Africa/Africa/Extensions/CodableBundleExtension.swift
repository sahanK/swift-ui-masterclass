//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Sahan Kaushalya on 2022-09-03.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    // Locate the JSON file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle")
    }
    // Create a property for data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from bundle")
    }
    // Create a decoder
    let decoder = JSONDecoder()
    // Create a property for decoded data
    guard let decodedData = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file)")
    }
    // Return decoded data
    return decodedData
  }
}
