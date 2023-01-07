//
//  SettingsView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-19.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  
  @State private var enableNitifications: Bool = true
  @State private var backgroundRefresh: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      // MARK: - HEADER
      VStack(alignment: .center, spacing: 5) {
        Image("avocado")
          .resizable()
          .scaledToFit()
          .padding(.top)
          .frame(width: 100, height: 100, alignment: .center)
          .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        
        Text("Avocados".uppercased())
          .font(.system(.title, design: .serif))
          .fontWeight(.bold)
        .foregroundColor(Color("ColorGreenAdaptive"))
      }//: VSTACK
      .padding()
      
      Form {
        // MARK: - SECTION #1
        Section(header: Text("General Settings")) {
          Toggle(isOn: $enableNitifications) {
            Text("Enable notifications")
          }
          Toggle(isOn: $backgroundRefresh) {
            Text("Background refresh")
          }
        }
        
        // MARK: - SECTION #2
        Section(header: Text("Application")) {
          if enableNitifications {
            HStack {
              Text("Product")
                .foregroundColor(.gray)
              Spacer()
              Text("Avocado Recipes")
            }
            HStack {
              Text("Compatibility")
                .foregroundColor(.gray)
              Spacer()
              Text("iPhone & iPad")
            }
            HStack {
              Text("Developer")
                .foregroundColor(.gray)
              Spacer()
              Text("Sahan Kaushalya")
            }
            HStack {
              Text("Designer")
                .foregroundColor(.gray)
              Spacer()
              Text("Sahan Kaushalya")
            }
            HStack {
              Text("Website")
                .foregroundColor(.gray)
              Spacer()
              Text("swiftuimasterclass.com")
            }
            HStack {
              Text("Version")
                .foregroundColor(.gray)
              Spacer()
              Text("1.0.0")
            }
          } else {
            HStack {
              Text("Personal message")
                .foregroundColor(.gray)
              Spacer()
              Text("Happy Coding!")
            }
          }
        }
      }
    }//: VSTACK
    .frame(maxWidth: 640)
  }//: BODY
}

// MARK: - PREVIEW

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
