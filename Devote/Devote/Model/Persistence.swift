//
//  Persistence.swift
//  Devote
//
//  Created by Sahan Walpita on 2022-09-10.
//

import CoreData

struct PersistenceController {
  // MARK: - 1. PERSISTENT CONTROLLER (SINGLETON)
  static let shared = PersistenceController()
  
  // MARK: - 2. PERSISTENT CONTAINER
  let container: NSPersistentContainer
  
  // MARK: - 3. INITIALIZATION (load the persistent store)
  // inMemory perfect for unit testing / and for using in the SwiftUI preview
  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "Devote")
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
  
  // MARK: - 4. PREVIEW
  // test configuraiton for SwiftUI previews 
  static var preview: PersistenceController = {
    let result = PersistenceController(inMemory: true)
    let viewContext = result.container.viewContext
    for i in 0..<5 {
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()
      newItem.task = "Sample task No \(i)"
      newItem.completion = false
      newItem.id = UUID()
    }
    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
    return result
  }()
}
