//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import Foundation

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    // 1. Locate the json file
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in Bundle")
    }
    // 2. Create property for data
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) from Bundle")
    }
    // 3. Create a decoder
    let decoder = JSONDecoder()
    // 4. Create property for decoded data
    guard let decodedData = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from Bundle")
    }
    // 5. Return decoded data
    return decodedData
  }
}
