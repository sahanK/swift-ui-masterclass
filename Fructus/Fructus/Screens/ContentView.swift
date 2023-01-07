//
//  ContentView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-08-30.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  
  @State private var isShowingSettings: Bool = false
  
  var fruites: [Fruit] = fruitesData
  
  // MARK: - Body
  
    var body: some View {
      NavigationView {
        List {
          ForEach(fruites.shuffled()) { fruite in
            NavigationLink(destination: FruitDetailView(fruit: fruite)) {
              FruitRowView(fruit: fruite)
                .padding(.vertical, 4)
            }
          }
        }//: LIST
        .navigationTitle("Fruites")
        .navigationBarItems(
          trailing: Button(action: {
            isShowingSettings = true
          }) {
            Image(systemName: "slider.horizontal.3")
          }//: BUTTON
          .sheet(isPresented: $isShowingSettings) {
            SettingsView()
          }
        )
      }//: NAVIGATION
      .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(fruites: fruitesData)
    }
}
