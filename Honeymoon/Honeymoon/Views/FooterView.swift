//
//  FooterView.swift
//  Honeymoon
//
//  Created by Sahan Walpita on 2023-01-02.
//

import SwiftUI

struct FooterView: View {
  // MARK: - PROPERTIES
  @Binding var showBookingAlert: Bool
  let hapticFeedback = UINotificationFeedbackGenerator()
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Image(systemName: "xmark.circle")
        .font(.system(size: 42, weight: .light))
      
      Spacer()
      
      Button(action: {
        playSound(sound: "sound-click", type: "mp3")
        hapticFeedback.notificationOccurred(.success)
        showBookingAlert.toggle()
      }, label: {
        Text("Book destination".uppercased())
          .font(.system(.subheadline, design: .rounded))
          .fontWeight(.heavy)
          .padding(.horizontal, 20)
          .padding(.vertical, 12)
          .tint(.pink)
          .background(
            Capsule().stroke(.pink, lineWidth: 2)
          )
      })
      
      Spacer()
      
      Image(systemName: "heart.circle")
        .font(.system(size: 42, weight: .light))
    }
    .padding()
  }
}

// MARK: - PREVIEW

struct FooterView_Previews: PreviewProvider {
  @State static var showAlert: Bool = false
  
  static var previews: some View {
    FooterView(showBookingAlert: $showAlert)
      .previewLayout(.fixed(width: 375, height: 80))
  }
}
