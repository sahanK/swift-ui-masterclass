//
//  InfoView.swift
//  Slot Machine
//
//  Created by Sahan Walpita on 2022-11-16.
//

import SwiftUI

struct InfoView: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      LogoView()
      
      Spacer()
      
      Form {
        Section(content: {
          FormRowView(firstItem: "Application", secondItem: "Slot Machine")
          FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, Mac")
          FormRowView(firstItem: "Developer", secondItem: "Sahan Kaushalya")
          FormRowView(firstItem: "Designer", secondItem: "Robert Petras")
          FormRowView(firstItem: "Music", secondItem: "Dan Lebowitz")
          FormRowView(firstItem: "Website", secondItem: "2022 All rights reserved")
          FormRowView(firstItem: "Copyright", secondItem: "Slot Machine")
          FormRowView(firstItem: "Version", secondItem: "1.0.0")
        }, header: {
          Text("About the application")
        })
      }
      .font(.system(.body, design: .rounded))
    }
    .padding(.top, 40)
    .overlay(
      Button(action: {
        presentationMode.wrappedValue.dismiss()
        audioPlayer?.stop()
      }) {
        Image(systemName: "xmark.circle")
          .font(.title)
      }
      .padding(.top, 30)
      .padding(.trailing, 20)
      .accentColor(.secondary),
      alignment: .topTrailing
    )
    .onAppear(perform: {
      playSound(sound: "background-music", type: "mp3")
    })
  }
}

struct FormRowView: View {
  var firstItem: String
  var secondItem: String
  
  var body: some View {
    HStack {
      Text(firstItem)
        .foregroundColor(.secondary)
      Spacer()
      Text(secondItem)
    }
  }
}

struct InfoView_Previews: PreviewProvider {
  static var previews: some View {
    InfoView()
  }
}
