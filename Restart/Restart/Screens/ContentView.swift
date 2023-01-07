//
//  ContentView.swift
//  Restart
//
//  Created by Sahan Kaushalya on 2022-08-29.
//

import SwiftUI

struct ContentView: View {
  @AppStorage("onBoarding") var isOnBoardingViewActive: Bool = true
  
  var body: some View {
    ZStack {
      if isOnBoardingViewActive {
        OnBoardingView()
      } else {
        HomeView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
