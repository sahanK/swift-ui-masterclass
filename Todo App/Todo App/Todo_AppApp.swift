//
//  Todo_AppApp.swift
//  Todo App
//
//  Created by Sahan Walpita on 2022-11-23.
//

import SwiftUI

@main
struct Todo_AppApp: App {
  let persistenceController = PersistenceController.shared
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .environmentObject(IconNames())
        .environmentObject(ThemeSettings())
    }
  }
}
