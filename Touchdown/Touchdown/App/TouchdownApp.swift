//
//  TouchdownApp.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

@main
struct TouchdownApp: App {
  var body: some Scene {
    WindowGroup {
        ContentView()
        .environmentObject(Shop())
    }
  }
}
