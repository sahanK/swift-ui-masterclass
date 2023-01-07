//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Sahan Walpita on 2022-09-07.
//

import SwiftUI

struct MotionAnimationView: View {
  // MARK: - Properties
  
  @State private var randomCircle: Int = Int.random(in: 12...16)
  @State private var isAnimating: Bool = false
  
  // MARK: - Functions
  
  // 1. RANDOM COORDIANTES
  func randomCoordinate(max: CGFloat) -> CGFloat {
    return CGFloat.random(in: 0...max)
  }
  // 2. RANDOM SIZE
  func randomSize() -> CGFloat {
    return CGFloat.random(in: 10...300)
  }
  // 3. RANDOM SCALE
  func randomScale() -> CGFloat {
    return CGFloat(Double.random(in: 0.1...2.0))
  }
  // 4. RANDOM SPEED
  func randomSpeed() -> Double {
    return Double.random(in: 0.25...1)
  }
  // 5. RANDOM DELAY
  func randDelay() -> Double {
    return Double.random(in: 0...2)
  }
  
  // MARK: - Body
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ForEach(0...randomCircle, id: \.self) { item in
          Circle()
            .foregroundColor(.gray)
            .opacity(0.15)
            .frame(width: randomSize(), height: randomSize(), alignment: .center)
            .scaleEffect(isAnimating ? randomScale() : 1)
            .position(
              x: randomCoordinate(max: geometry.size.width),
              y: randomCoordinate(max: geometry.size.height)
            )
            .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever().speed(randomSpeed()).delay(randDelay()))
            .onAppear {
              isAnimating = true
            }
        }//: LOOP
      }//: ZSTACK
      .drawingGroup()
    }//: GEOMETRY
  }//: BODY
}

// MARK: - Preview

struct MotionAnimationView_Previews: PreviewProvider {
  static var previews: some View {
      MotionAnimationView()
  }
}
