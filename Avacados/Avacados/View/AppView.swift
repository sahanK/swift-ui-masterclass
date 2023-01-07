//
//  AppView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-19.
//

import SwiftUI

struct AppView: View {
    var body: some View {
      TabView {
        AvocadosView()
          .tabItem ({
            Image("tabicon-branch")
            Text("Avocados")
          })
        
        ContentView()
          .tabItem ({
            Image("tabicon-book")
            Text("Receipes")
          })
        
        RipeningStagesView()
          .tabItem ({
            Image("tabicon-avocado")
            Text("Ripening")
          })
        
        SettingsView()
          .tabItem ({
            Image("tabicon-settings")
            Text("Settings")
          })
      }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
