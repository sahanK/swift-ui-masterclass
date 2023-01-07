//
//  PageModel.swift
//  Pinch
//
//  Created by Sahan Kaushalya on 2022-08-30.
//

import Foundation

struct Page: Identifiable {
  var id: Int
  let imageName: String
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}
