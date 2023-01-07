//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Sahan Walpita on 2022-09-13.
//

import SwiftUI

struct NewTaskItemView: View {
  // MARK: - Properties
  @Environment(\.managedObjectContext) private var viewContext
  @AppStorage("isDarkMode") private var isDarkMode: Bool = false
  
  @State private var taskInput: String = ""
  private var isButtonDisabled: Bool {
    return taskInput.isEmpty
  }
  
  @Binding var isShowing: Bool
  
  // MARK: - Functions
  
  private func addItem() {
    withAnimation {
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()
      newItem.task = taskInput
      newItem.completion = false
      newItem.id = UUID()
      
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
      
      taskInput = ""
      hideKeyboard()
      isShowing = false
    }
  }
  
  // MARK: - Body
  
  var body: some View {
    VStack {
      Spacer()
      VStack(spacing: 16){
        TextField("New Task", text: $taskInput)
          .foregroundColor(.pink)
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .padding()
          .background(
            isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
          )
          .cornerRadius(10)
        Button(action: {
          addItem()
          playSound(sound: "sound-ding", type: "mp3")
        }){
          Spacer()
          Text("save".uppercased())
            .font(.system(size: 24, weight: .bold, design: .rounded))
          Spacer()
        }
        .disabled(isButtonDisabled)
        .onTapGesture {
          if isButtonDisabled {
            playSound(sound: "sound-tap", type: "mp3")
          }
        }
        .padding()
        .foregroundColor(.white)
        .background(isButtonDisabled ? .blue : .pink)
        .cornerRadius(10)
      }//: VSTACK
      .padding(.horizontal)
      .padding(.vertical, 20)
      .background(isDarkMode ? Color(UIColor.secondarySystemBackground) : .white)
      .cornerRadius(16)
      .shadow(color: .black.opacity(0.65), radius: 24)
      .frame(maxWidth: 640)
    }//: VSTACK
    .padding()
  }// MARK: - BODY
}

// MARK: - Preview

struct NewTaskItemView_Previews: PreviewProvider {
  static var previews: some View {
    NewTaskItemView(isShowing: .constant(true))
      .background(Color.gray.edgesIgnoringSafeArea(.all))
  }
}
