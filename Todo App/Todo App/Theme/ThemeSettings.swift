//
//  ThemeSettings.swift
//  Todo App
//
//  Created by Sahan Walpita on 2022-12-27.
//

import SwiftUI

class ThemeSettings: ObservableObject {
  @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
    didSet {
      UserDefaults.standard.set(themeSettings, forKey: "Theme")
    }
  }
}
