//
//  VideoListView.swift
//  Africa
//
//  Created by Sahan Kaushalya on 2022-09-03.
//

import SwiftUI

struct VideoListView: View {
  // MARK: - Properties
  
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  
  let hapticFeedback = UIImpactFeedbackGenerator(style: .medium)
  
  // MARK: - Body
  
  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
            VideoListItemView(video: item)
              .padding(.vertical)
          }
        }//: LOOP
      }//: LIST
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            videos.shuffle()
            hapticFeedback.impactOccurred()
          }) {
            Image(systemName: "arrow.2.squarepath")
          }
        }
      }//: TOOLBAR
    }//: NAVIGATION
  }//: BODY
}

// MARK: - Preview

struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
      VideoListView()
  }
}
