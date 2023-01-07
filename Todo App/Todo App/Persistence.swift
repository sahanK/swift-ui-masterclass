//
//  Persistence.swift
//  Todo App
//
//  Created by Sahan Walpita on 2022-11-23.
//

import CoreData

struct PersistenceController {
  // MARK: - PERSISTENCE CONTROLLER (SINGLETON)
  static let shared = PersistenceController()
  
  // MARK: - PERSISTENCE CONTAINER
  let container: NSPersistentContainer
  
  
  // MARK: - INITIALIZATION (load the persistence store)
  // inMemory perfect for unit testing and using in the SwiftUI Preview
  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "Todo_App")
    if inMemory {
      container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
    }
    container.viewContext.automaticallyMergesChangesFromParent = true
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
  }
  
  // MARK: - PREVIEW
  // test configuration for SwiftUI Previews
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    for _ in 0 ..< 5 {
      let newTodo = Todo(context: viewContext)
      newTodo.name = "Test todo"
      newTodo.priority = Priority.normal.rawValue
      newTodo.id = UUID()
    }
    do {
      try viewContext.save()
    } catch {
      // Replace this implementation with code to handle the error appropriately.
      // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()
}
