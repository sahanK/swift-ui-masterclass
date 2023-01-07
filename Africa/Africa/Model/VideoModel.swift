//
//  VideoModel.swift
//  Africa
//
//  Created by Sahan Walpita on 2022-09-06.
//

import Foundation

struct Video : Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computed property
  var thumbnail: String {
    "video-\(id)"
  }
}
