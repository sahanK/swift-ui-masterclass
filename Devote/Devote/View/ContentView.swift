//
//  ContentView.swift
//  Devote
//
//  Created by Sahan Walpita on 2022-09-10.
//

import SwiftUI
import CoreData

struct ContentView: View {
  // MARK: - PROPERTIES
  @Environment(\.managedObjectContext) private var viewContext
  @AppStorage("isDarkMode") private var isDarkMode: Bool = false
  
  @State private var showNewTaskItemView: Bool = false
  
  // FETCHING DATA
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>
  
  // MARK: - FUNCTIONS
  
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(viewContext.delete)
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
  
  // MARK: - BODY
  
  var body: some View {
    NavigationView {
      ZStack {
        // MARK: - MAIN VIEW
        VStack {
          // MARK: - HEADER
          
          HStack(spacing: 10) {
            Text("Devote")
              .font(.system(.largeTitle, design: .rounded))
              .fontWeight(.heavy)
            Spacer()
            EditButton()
              .font(.system(size: 16, weight: .semibold, design: .rounded))
              .padding(.horizontal, 10)
              .frame(minWidth: 70, minHeight: 24)
              .background(
                Capsule().stroke(.white, lineWidth: 2)
              )
            Button(action: {
              isDarkMode.toggle()
              playSound(sound: "sound-tap", type: "mp3")
            }) {
              Image(systemName: isDarkMode ? "moon.circle.fill" :  "moon.circle")
                .resizable()
                .frame(width: 24, height: 24)
                .font(.system(.title2, design: .rounded))
            }
          }//: HSTACK
          .padding()
          .foregroundColor(.white)
          
          Spacer(minLength: 80)
          // MARK: - NEW TASK BUTTON
          Button(action: {
            showNewTaskItemView = true
            playSound(sound: "sound-ding", type: "mp3")
          }) {
            Image(systemName: "plus.circle")
              .font(.system(size: 30, weight: .semibold, design: .rounded))
            Text("New Task")
              .font(.system(size: 24, weight: .bold, design: .rounded))
          }
          .padding(.horizontal, 20)
          .padding(.vertical, 15)
          .foregroundColor(.white)
          .background(
            LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .leading, endPoint: .trailing)
              .clipShape(Capsule())
          )
          .shadow(color: .black.opacity(0.25), radius: 8, x: 0.0, y: 4.0)
          // MARK: - TASKS
          List {
            ForEach(items) { item in
              ListRowItemView(item: item)
            }
            .onDelete(perform: deleteItems)
          }//: LIST
          .listStyle(InsetGroupedListStyle())
          .shadow(color: .black.opacity(0.3), radius: 12)
          .padding(.vertical, 0)
          .frame(maxWidth: 640)
        }//: VSTACK
        .blur(radius: showNewTaskItemView ? 8.0 : 0, opaque: false)
        .transition(.move(edge: .bottom))
        .animation(.easeOut(duration: 0.5))
        
        // MARK: - NEW TASK ITEM
        
        if showNewTaskItemView {
          BlankView(
            backgroundColor: isDarkMode ? .black : .gray,
            backgroundOpacity: isDarkMode ? 0.3 : 0.5
          )
          .onTapGesture {
            withAnimation {
              showNewTaskItemView = false
            }
          }
          NewTaskItemView(isShowing: $showNewTaskItemView)
        }
        
      }//: ZSTACK
      .onAppear {
        UITableView.appearance().backgroundColor = .clear
      }
      .background(
        BackgroundImageView()
          .blur(radius: showNewTaskItemView ? 8.0 : 0, opaque: false)
      )
      .background(backgroundGradient.ignoresSafeArea(.all))
      .navigationTitle("Daily Tasks")
      .navigationBarHidden(true)
      .navigationBarTitleDisplayMode(.large)
    }//: NAVIGATION
    .navigationViewStyle(StackNavigationViewStyle())
  }//: BODY
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
