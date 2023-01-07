//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Sahan Walpita on 2023-01-02.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - PROPERTIES
  @Binding var showGuideView: Bool
  @Binding var showInfoView: Bool
  let hapticFeedback = UINotificationFeedbackGenerator()
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Button(action: {
        playSound(sound: "sound-click", type: "mp3")
        hapticFeedback.notificationOccurred(.success)
        showGuideView.toggle()
      }, label: {
        Image(systemName: "info.circle")
          .font(.system(size: 24, weight: .regular))
      })
      .tint(.primary)
      
      Spacer()
      
      Image("logo-honeymoon-pink")
        .resizable()
        .scaledToFit()
        .frame(height: 28)
      
      Spacer()
      
      Button(action: {
        playSound(sound: "sound-click", type: "mp3")
        hapticFeedback.notificationOccurred(.success)
        showInfoView.toggle()
      }, label: {
        Image(systemName: "questionmark.circle")
          .font(.system(size: 24, weight: .regular))
      })
      .tint(.primary)
      .sheet(isPresented: $showGuideView) {
        GuideView()
      }
      .sheet(isPresented: $showInfoView) {
        InfoView()
      }
    }
    .padding()
  }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
  @State static var showGuide: Bool = false
  @State static var showInfo: Bool = false
  
  static var previews: some View {
    HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
      .previewLayout(.fixed(width: 375, height: 80))
  }
}
