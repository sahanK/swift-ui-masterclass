//
//  MainView.swift
//  Africa
//
//  Created by Sahan Kaushalya on 2022-09-03.
//

import SwiftUI

struct MainView: View {
    var body: some View {
      TabView {
        ContentView()
          .tabItem {
            Image(systemName: "square.grid.2x2")
            Text("Browse")
          }
        
        VideoListView()
          .tabItem {
            Image(systemName: "play")
            Text("Watch")
          }
        
        MapView()
          .tabItem {
            Image(systemName: "location")
            Text("Map")
          }
        
        GalleryView()
          .tabItem {
            Image(systemName: "photo")
            Text("Gallery")
          }
      }//: TAB
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
