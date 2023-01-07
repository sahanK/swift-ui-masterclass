//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Sahan Walpita on 2022-09-06.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  // MARK: - Properties
  
  let videoSelected: String
  let videoTitle: String
  
  // MARK: - Body
  
  var body: some View {
    VStack {
      VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
//        Text(videoTitle)
      }
      .overlay(
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32)
          .padding(.top, 6)
          .padding(.horizontal),
        alignment: .topLeading
      )
    }//: VSTACK
    .accentColor(.accentColor)
    .navigationBarTitle(videoTitle, displayMode: .inline)
  }//: BODY
}

// MARK: - Preview

struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
    }
  }
}
