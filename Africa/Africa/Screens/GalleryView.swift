//
//  GalleryView.swift
//  Africa
//
//  Created by Sahan Kaushalya on 2022-09-03.
//

import SwiftUI

struct GalleryView: View {
  // MARK: - Properties
  
  @State private var selectedAnimal: String = "lion"
  
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let hapticFeedback = UIImpactFeedbackGenerator()
  
  // SIMPLE GRID DEFINITION
  // let gridLayout: [GridItem] = [
  //   GridItem(.flexible()),
  //   GridItem(.flexible()),
  //   GridItem(.flexible())
  // ]
  
  // EFFICIENT GRID DEFINITION
  // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  
  // DYNAMIC GRID LAYOUT
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumns: Double = 3.0
  
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
  }
  
  // MARK: - Body
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack(alignment: .center, spacing: 30) {
        // MARK: - Grid
        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(Circle().stroke(.white, lineWidth: 8))
        
        // MARK: - Slider
        Slider(value: $gridColumns, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumns, perform: { value in
            withAnimation(.easeIn) {
              hapticFeedback.impactOccurred()
              gridSwitch()
            }
          })
        
        // MARK: - Grid
        
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 30) {
          ForEach(animals) { animal in
            Image(animal.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(
                Circle()
                  .stroke(.white, lineWidth: 2)
              )
              .onTapGesture {
                selectedAnimal = animal.image
              }
          }//: LOOP
        }//: GRID
        .onAppear {
          gridSwitch()
        }
      }//: VSTACK
      .padding(.vertical, 50)
      .padding(.horizontal, 10)
    }//: SCROLL
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }//: BODY
}

// MARK: - Preview

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
      GalleryView()
  }
}
