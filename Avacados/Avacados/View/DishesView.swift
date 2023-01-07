//
//  DishesView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-27.
//

import SwiftUI

struct DishesView: View {
  // MARK: - PROPERTIES
  
  // MARK: - BODY
  
  var body: some View {
    HStack(alignment: .center, spacing: 4) {
      // MARK: - 1ST COLUMN
      VStack(alignment: .leading, spacing: 4)  {
        HStack {
          Image("icon-toasts")
            .resizable()
            .modifier(IconModifier())
          Spacer()
          Text("Toasts")
        }
        Divider()
        HStack {
          Image("icon-tacos")
            .resizable()
            .modifier(IconModifier())
          Spacer()
          Text("Tacos")
        }
        Divider()
        HStack {
          Image("icon-salads")
            .resizable()
            .modifier(IconModifier())
          Spacer()
          Text("Salads")
        }
        Divider()
        HStack {
          Image("icon-halfavo")
            .resizable()
            .modifier(IconModifier())
          Spacer()
          Text("Spreads")
        }
      }//: VSTACK
      
      // MARK: - 2ND COLUMN
      
      VStack(alignment: .center, spacing: 4) {
        HStack {
          Divider()
        }
        
        Image(systemName: "heart.circle")
          .font(Font.title.weight(.ultraLight))
          .imageScale(.large)
        
        HStack {
          Divider()
        }
      }//: VSTACK
      
      // MARK: - 3RD COLUMN
      
      VStack(alignment: .leading, spacing: 4) {
        HStack {
          Text("Guacamole")
          Spacer()
          Image("icon-guacamole")
            .resizable()
            .modifier(IconModifier())
        }
        Divider()
        HStack {
          Text("Sandwiches")
          Spacer()
          Image("icon-sandwiches")
            .resizable()
            .modifier(IconModifier())
        }
        Divider()
        HStack {
          Text("Soup")
          Spacer()
          Image("icon-soup")
            .resizable()
            .modifier(IconModifier())
        }
        Divider()
        HStack {
          Text("Smoothie")
          Spacer()
          Image("icon-smoothies")
            .resizable()
            .modifier(IconModifier())
        }
      }//: VSTACK
      
    }//: HSTACK
    .font(.system(.callout, design: .serif))
    .foregroundColor(.gray)
    .padding(.horizontal)
    .frame(maxHeight: 220)
  }
}

struct IconModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(width: 42, height: 42, alignment: .center)
  }
}

// MARK: - PREVIEW

struct DishesView_Previews: PreviewProvider {
  static var previews: some View {
    DishesView()
      .previewLayout(.fixed(width: 414, height: 280))
      .padding()
  }
}
