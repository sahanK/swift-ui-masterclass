//
//  AddTodoView.swift
//  Todo App
//
//  Created by Sahan Walpita on 2022-11-23.
//

import SwiftUI

struct AddTodoView: View {
  // MARK: - PROPERTIES
  
  @Environment(\.presentationMode) var presentationMode
  @Environment(\.managedObjectContext) var managedObjectContext
  @EnvironmentObject var theme: ThemeSettings
  let themes: [Theme] = themeData
  
  @State private var name: String = ""
  @State private var priority: Priority = Priority.normal
  @State private var errorShowing: Bool = false
  @State private var errorTitle: String = ""
  @State private var errorMessage: String = ""
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      VStack {
        VStack(alignment: .leading, spacing: 20) {
          // MARK: - TODO NAME
          TextField("Todo", text: $name)
            .padding()
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(9)
            .font(.system(size: 24, weight: .bold, design: .default))
          
          // MARK: - TODO PRIOROTY
          Picker("Priority", selection: $priority) {
            ForEach(Priority.allCases, id: \.self) {
              Text($0.rawValue)
            }
          }//: PICKER
          .pickerStyle(.segmented)
          
          Button(action: {
            if name != "" {
              let todo = Todo(context: managedObjectContext)
              todo.name = name
              todo.priority = priority.rawValue
              do {
                try managedObjectContext.save()
              } catch {
                print(error)
              }
              presentationMode.wrappedValue.dismiss()
            } else {
              errorShowing.toggle()
              errorTitle = "Invalid name"
              errorMessage = "Make sure to enter something for\nthe new item"
            }
          }, label: {
            Text("Save")
              .font(.system(size: 24, weight: .bold, design: .default))
              .padding()
              .frame(minWidth: 0, maxWidth: .infinity)
              .background(themes[theme.themeSettings].themeColor)
              .cornerRadius(9)
              .foregroundColor(.white)
          })//: SAVE BUTTON
        }//: VSTACK
        .padding(.horizontal)
        .padding(.vertical, 30)
        
        Spacer()
      }//: VSTACK
      .navigationTitle("New Todo")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem {
          Button(action: {
            presentationMode.wrappedValue.dismiss()
          }, label: {
            Image(systemName: "xmark")
          })
        }
      }
      .alert(errorTitle, isPresented: $errorShowing, actions: {
        Button(action: {}, label: {
          Text("OK")
        })
      }, message: {
        Text(errorMessage)
      })
    }//: NAVIGATION
    .tint(themes[theme.themeSettings].themeColor)
    .navigationViewStyle(StackNavigationViewStyle())
  }//: BODY
}

// MARK: - PREVIEW

struct AddTodoView_Previews: PreviewProvider {
  static var previews: some View {
    AddTodoView()
  }
}
