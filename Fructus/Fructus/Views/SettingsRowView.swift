//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-09-02.
//

import SwiftUI

struct SettingsRowView: View {
  // MARK: - Properties
  
  var name: String
  var content: String? = nil
  var linkLabel: String? = nil
  var linkDestination: String? = nil
  
  // MARK: - Body
  
    var body: some View {
      VStack {
        Divider().padding(.vertical, 4)
        HStack {
          Text(name).foregroundColor(.secondary)
          Spacer()
          if content != nil {
            Text(content!)
          } else if linkLabel != nil && linkDestination  != nil {
            Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
            Image(systemName: "arrow.up.right.square")
              .foregroundColor(.pink)
          } else {
            /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
          }
        }//: HSTACK
      }//: VSTACK
    }//: BODY
}

// MARK: - Preview

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        SettingsRowView(name: "Developer", content: "Sahan Kaushalya")
          .previewLayout(.sizeThatFits)
        .padding()
        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
          .preferredColorScheme(.dark)
          .previewLayout(.sizeThatFits)
          .padding()
      }
    }
}
