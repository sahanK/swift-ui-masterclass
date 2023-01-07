//
//  SettingsView.swift
//  Todo App
//
//  Created by Sahan Walpita on 2022-12-26.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var iconSettings: IconNames
  @EnvironmentObject var theme: ThemeSettings
  
  let themes: [Theme] = themeData
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      VStack {
        // MARK: - FORM
        Form {
          Section(content: {
            Picker(selection: $iconSettings.currentIndex, content: {
              ForEach(0..<iconSettings.iconNames.count) {index in
                HStack {
                  Image(uiImage: UIImage(named: iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44, alignment: .center)
                    .cornerRadius(8)
                  
                  Spacer().frame(width: 8)
                  
                  Text(self.iconSettings.iconNames[index] ?? "Blue")
                    .frame(alignment: .leading)
                }//: HSTACK
              }
            }, label: {
              HStack {
                ZStack {
                  RoundedRectangle(cornerRadius: 9, style: .continuous)
                    .strokeBorder(.primary, lineWidth: 2)
                  Image(systemName: "paintbrush")
                    .font(.system(size: 28, weight: .regular, design: .default))
                  .foregroundColor(.primary)
                }
                .frame(width: 44, height: 44)
                Text("App icon".uppercased())
                  .fontWeight(.bold)
                  .foregroundColor(.primary)
              }//: LABEL
            })//: PICKER
            .onReceive([iconSettings.currentIndex].publisher.first(), perform: { (value) in
              let index = iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
              if index != value {
                UIApplication.shared.setAlternateIconName(iconSettings.iconNames[value], completionHandler: { error in
                  if let error = error {
                    print(error.localizedDescription)
                  } else {
                    print("You have changed the app icon")
                  }
                })
              }
            })
          }, header: {
            Text("Choose the app icon")
          })
          .padding(.vertical, 3)//: SECTION 1
          
          Section(content: {
            ForEach(themes, id: \.id) { item in
              Button(action: {
                theme.themeSettings = item.id
                UserDefaults.standard.set(theme.themeSettings, forKey: "Theme")
              }, label: {
                HStack {
                  Image(systemName: "circle.fill")
                    .foregroundColor(item.themeColor)
                  Text(item.themeName)
                    .foregroundColor(.primary)
                }
              })
            }
          }, header: {
            HStack {
              Text("Choose the app theme")
              Image(systemName: "circle.fill")
                .resizable()
                .frame(width: 10, height: 10)
                .foregroundColor(themes[theme.themeSettings].themeColor)
            }
          })
          .padding(.vertical, 3)//: SECTION 2
          
          Section(content: {
            FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://swiftuimasterclass.com")
            FormRowLinkView(icon: "link", color: .blue, text: "Twitter", link: "https://twitter.com")
            FormRowLinkView(icon: "play.rectangle", color: .green, text: "Courses", link: "https://udemy.com")
          }, header: {
            Text("Follow us on social media")
          })
          .padding(.vertical, 3)//: SECTION 3
          
          Section(content: {
            FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
            FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
            FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Sahan Kaushalya")
            FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Sahan Kaushalya")
            FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
          }, header: {
            Text("About the Application")
          })
          .padding(.vertical, 3)//: SECTION 4
        }//: FORM
        
        // MARK: - FOOTER
        Text("Copuright All Rights Reserved.\nBetter Apps ♡ Less Code")
          .multilineTextAlignment(.center)
          .font(.footnote)
          .padding(.top, 6)
          .padding(.bottom, 8)
          .foregroundColor(.secondary)
      }//: VSTACK
      .navigationTitle("Settings")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar(content: {
        Button(action: {
          presentationMode.wrappedValue.dismiss()
        }, label: {
          Image(systemName: "xmark")
        })
      })
      .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
    }//: NAVIGATION
    .tint(themes[theme.themeSettings].themeColor)
    .navigationViewStyle(StackNavigationViewStyle())
  }//: BODY
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
      .environmentObject(IconNames())
  }
}
