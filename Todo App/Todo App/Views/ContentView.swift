//
//  ContentView.swift
//  Todo App
//
//  Created by Sahan Walpita on 2022-11-23.
//

import SwiftUI
import CoreData

struct ContentView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.managedObjectContext) var managedObjectContext
  @EnvironmentObject var iconSettings: IconNames
  @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
  @EnvironmentObject var theme: ThemeSettings
  let themes: [Theme] = themeData
  
  @State private var showingAddTodoView: Bool = false
  @State private var animatingButton: Bool = false
  @State private var showingSettingsView: Bool = false
  
  // MARK: - FUNCTIONS
  
  func deleteTodo(at offsets: IndexSet) {
    for index in offsets {
      let todo = todos[index]
      managedObjectContext.delete(todo)
      do {
        try managedObjectContext.save()
      } catch {
        print(error)
      }
    }
  }
  
  private func colorize(priority: String) -> Color {
    switch priority {
      case "High":
        return .pink
      case "Normal":
        return .green
      case "Low":
        return .blue
      default:
        return .gray
    }
  }
  
  // MARK: - BODY
  
  var body: some View {
    NavigationView {
      ZStack {
        List {
          ForEach(todos, id: \.self) { todo in
            HStack {
              Circle()
                .frame(width: 12, height: 12, alignment: .center)
                .foregroundColor(colorize(priority: todo.priority ?? "Normal"))
              Text(todo.name ?? "Unknown")
                .fontWeight(.semibold)
              Spacer()
              Text(todo.priority ?? "Unknown")
                .font(.footnote)
                .foregroundColor(Color(UIColor.systemGray2))
                .padding(3)
                .frame(minWidth: 62)
                .overlay(
                  Capsule()
                    .stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                )
            }//: HSTACK
            .padding(.vertical, 10)
          }//: FOREACH
          .onDelete(perform: deleteTodo)
        }//: LIST
        .toolbar {
          ToolbarItem {
            Button(action: {
              showingSettingsView.toggle()
            }) {
              Image(systemName: "paintbrush")
                .imageScale(.large)
            }
            .tint(themes[theme.themeSettings].themeColor)
          }
        }
        .navigationTitle("ToDo")
        .navigationBarTitleDisplayMode(.inline)
        // MARK: - NO TODOS
        if todos.count == 0 {
          EmptyListView()
        }
      }//: ZSTACK
      .sheet(isPresented: $showingAddTodoView) {
        AddTodoView()
          .environment(\.managedObjectContext, managedObjectContext)
      }
      .sheet(isPresented: $showingSettingsView) {
        SettingsView()
          .environmentObject(iconSettings)
      }//: SHEET
      .overlay(
        ZStack {
          Group {
            Circle()
              .fill(themes[theme.themeSettings].themeColor)
              .opacity(animatingButton ? 0.2 : 0)
              .frame(width: 68, height: 68, alignment: .center)
              .scaleEffect(animatingButton ? 1 : 0)
            Circle()
              .fill(themes[theme.themeSettings].themeColor)
              .opacity(animatingButton ? 0.15 : 0)
              .frame(width: 88, height: 88, alignment: .center)
              .scaleEffect(animatingButton ? 1 : 0)
          }
          
          Button(action: {
            showingAddTodoView.toggle()
          }) {
            Image(systemName: "plus.circle.fill")
              .resizable()
              .scaledToFit()
              .background(Circle().fill(Color("ColorBase")))
              .frame(width: 48, height: 48, alignment: .center)
          }
          .tint(themes[theme.themeSettings].themeColor)
          .onAppear(perform: {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
              animatingButton.toggle()
            }
          })
        }//: ZSTACK
          .padding(.bottom, 15)
          .padding(.trailing, 15)
        , alignment: .bottomTrailing
      )//: OVERLAY
    }//: NAVIGATION
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

private let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
      .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
      .environmentObject(ThemeSettings())
  }
}
