//
//  AvocadosView.swift
//  Avacados
//
//  Created by Sahan Walpita on 2022-09-19.
//

import SwiftUI

struct AvocadosView: View {
  // MARK: - PROPERTIES
  
  @State private var pulsateAnimation: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Spacer()
      
      Image("avocado")
        .resizable()
        .scaledToFit()
        .frame(width: 240, height: 240, alignment: .center)
        .shadow(color: Color("ColorBlackTransparentDark"), radius: 12, x: 0, y: 8)
        .scaleEffect(pulsateAnimation ? 1 : 0.9)
        .opacity(pulsateAnimation ? 1 : 0.9)
      
      VStack {
        Text("Avocados".uppercased())
          .font(.system(size: 42, weight: .bold, design: .serif))
          .foregroundColor(.white)
          .padding()
          .shadow(color: Color("ColorBlackTransparentDark"), radius: 4, x: 0, y: 4)
        Text("""
Creamy, green, and full of nutrients!
Avocado is a powerhouse ingredient at any meal. Enjoy these handpicked avocado recipes for breakfast, lunch, dinner & more!
""")
          .lineLimit(nil)
          .font(.system(.headline, design: .serif))
          .foregroundColor(Color("ColorGreenLight"))
          .multilineTextAlignment(.center)
          .lineSpacing(8)
          .frame(maxWidth: 640, minHeight: 120)
          .padding()
      }//: VSTACK
      
      Spacer()
    }//: VSTACK
    .background(
      Image("background")
        .resizable()
        .scaledToFill()
    )
    .edgesIgnoringSafeArea(.all)
    .onAppear {
      withAnimation(.easeOut(duration: 1.5).repeatForever()) {
        pulsateAnimation.toggle()
      }
    }
  }//: BODY
}
// MARK: - PREVIEW
 
struct AvocadosView_Previews: PreviewProvider {
  static var previews: some View {
    AvocadosView()
      .preferredColorScheme(.dark)
  }
}
