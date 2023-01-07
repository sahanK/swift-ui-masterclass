//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by Sahan Walpita on 2022-09-09.
//

import SwiftUI

struct NavigationBarView: View {
  // MARK: - Properties
  
  @State private var isAnimated: Bool = false
  
  // MARK: - Body
  
  var body: some View {
    HStack {
      Button(action: {}) {
        Image(systemName: "magnifyingglass")
          .font(.title)
          .foregroundColor(.black)
      }//: BUTTON
      
      Spacer()
      
      LogoView()
        .opacity(isAnimated ? 1 : 0)
        .offset(x: 0, y: isAnimated ? 0 : -25)
        .onAppear {
          withAnimation(.easeOut) {
            isAnimated.toggle()
          }
        }
      
      Spacer()
      
      Button(action: {}) {
        ZStack {
          Image(systemName: "cart")
            .font(.title)
            .foregroundColor(.black)
          
          Circle()
            .fill(.red)
            .frame(width: 14, height: 14, alignment: .center)
            .offset(x: 13, y: -10)
        }
      }//: BUTTON
    }//: HSTACK
  }//: BODY
}

// MARK: - Preview

struct NavigationBarView_Previews: PreviewProvider {
  static var previews: some View {
      NavigationBarView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
