//
//  ContentView.swift
//  Africa
//
//  Created by Sahan Kaushalya on 2022-09-03.
//

import SwiftUI

struct ContentView: View {
  // MARK: - Properties
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let hapticFeedback = UIImpactFeedbackGenerator()
  
  @State private var isGridViewActive: Bool = false
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumns: Int = 1
  @State private var toolBarIcon: String = "square.grid.2x2"
  
  // MARK: - FUNCTIONS
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
    gridColumns = gridLayout.count
    switch gridColumns {
      case 1:
        toolBarIcon = "square.grid.2x2"
      case 2:
        toolBarIcon = "square.grid.3x2"
      case 3:
        toolBarIcon = "rectangle.grid.1x2"
      default:
        toolBarIcon = "rectangle.grid.2x2"
    }
  }
  
  // MARK: - Body
  
  var body: some View {
    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
                  .padding(.vertical, 8)
              }//: LINK
            }//: LOOP
            CreditsView()
              .modifier(CenterModifier())
          }//: LIST
          .listStyle(PlainListStyle())
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                }//: LINK
              }//: LOOP
            }//: GRID
            .padding(10)
          }//: SCROLL
        }//: LIST
      }//: GROUP
      .navigationTitle("Africa")
      .navigationBarTitleDisplayMode(.large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            // LIST BUTTON
            Button(action: {
              withAnimation(.easeIn) {
                isGridViewActive = false
                hapticFeedback.impactOccurred()
              }
            }) {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(.title2)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }
            
            // GRID BUTTON
            Button(action: {
              withAnimation(.easeOut) {
                isGridViewActive = true
                hapticFeedback.impactOccurred()
                gridSwitch()
              }
            }) {
              Image(systemName: toolBarIcon)
                .font(.title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary  )
            }
          }//: HSTACK
        }//: BUTTONS
      }//: TOOLBAR
    }//: NAVIGATION
  }//: BODY
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
