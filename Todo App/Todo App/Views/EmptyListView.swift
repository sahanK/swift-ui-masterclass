//
//  EmptyListView.swift
//  Todo App
//
//  Created by Sahan Walpita on 2022-12-23.
//

import SwiftUI

struct EmptyListView: View {
  // MARK: - PROPERTIES
  @EnvironmentObject var theme: ThemeSettings
  let themes: [Theme] = themeData
  
  @State private var isAnimated: Bool = false
  
  let images: [String] = [
    "illustration-no1",
    "illustration-no2",
    "illustration-no3"
  ]
  
  let tips: [String] = [
    "Use your time wisely",
    "Keep it short and sweet",
    "Put hard task first",
    "Reward yourself after work",
    "Each night schedule for tomorrow",
    "Collect tasks ahead of time"
  ]
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      VStack(alignment: .center, spacing: 20) {
        Image("\(images.randomElement() ?? images[0])")
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
          .layoutPriority(1)
          .foregroundColor(themes[theme.themeSettings].themeColor)
        Text("\(tips.randomElement() ?? tips[0])")
          .layoutPriority(0.5)
          .font(.system(.headline, design: .rounded))
          .foregroundColor(themes[theme.themeSettings].themeColor)
      }//: VSTACK
      .padding(.horizontal)
      .opacity(isAnimated ? 1 : 0)
      .offset(y: isAnimated ? 0 : -50)
      .onAppear(perform: {
        withAnimation(.easeOut(duration: 2.5)) {
          isAnimated.toggle()
        }
      })
    }//: ZSTACK
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color("ColorBase"))
    .ignoresSafeArea(.all)
  }//: BODY
}

// MARK: - PREVIEW
struct EmptyListView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyListView()
      .environment(\.colorScheme, .dark)
      .environmentObject(ThemeSettings())
  }
}
