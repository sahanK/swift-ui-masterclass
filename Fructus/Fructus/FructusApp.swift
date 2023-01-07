//
//  FructusApp.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-30.
//

import SwiftUI

@main
struct FructusApp: App {
  @AppStorage("isOnboarding") var isOnboarding: Bool = true
  
    var body: some Scene {
        WindowGroup {
          if isOnboarding {
            OnBoardingView()
          } else {
            ContentView()
          }
        }
    }
}
