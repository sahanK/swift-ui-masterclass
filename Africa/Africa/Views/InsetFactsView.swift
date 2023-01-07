//
//  InsetFactsView.swift
//  Africa
//
//  Created by Sahan Kaushalya on 2022-09-04.
//

import SwiftUI

struct InsetFactsView: View {
  // MARK: - Properties
  
  let animal: Animal
  
  // MARK: - Body
  
  var body: some View {
    GroupBox {
      TabView {
        ForEach(animal.fact, id: \.self) { item in
          Text(item)
        }
      }
      .tabViewStyle(PageTabViewStyle())
      .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
    }
  }
}

// MARK: - Preview

struct InsetFactsView_Previews: PreviewProvider {
  static let animals: [Animal] = Bundle.main.decode("animals.json")
  
  static var previews: some View {
    InsetFactsView(animal: animals[1])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
