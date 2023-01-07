//
//  SettingsView.swift
//  Fructus
//
//  Created by Sahan Kaushalya on 2022-09-01.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - Properties
  
  @Environment(\.presentationMode) var presentationMode
  @AppStorage("isOnboarding") var isOnboarding: Bool = false
  
  // MARK: - Body
  
    var body: some View {
      NavigationView {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 20) {
            // MARK: - SECTION 1
            
            GroupBox(
              label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
            ) {
              Divider().padding(.vertical, 4)
              HStack(alignment: .center, spacing: 10) {
                Image("logo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 80, height: 80)
                  .cornerRadius(9)
                Text("Most fruites are naturally low in fat, sodium and calories. None have cholsestorol. Fruites are sources of many essential nutrients including potassium, dietary fiber, vitamins and much more.")
                  .font(.footnote)
              }//: HSTACK
            }//: GROUP BOX
            
            // MARK: - SECTION 2

            GroupBox (
              label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
            ) {
              Divider().padding(.vertical, 4)
              Text("If you wish you can resart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome scree again")
                .padding(.vertical, 8)
                .frame(minHeight: 60)
                .layoutPriority(1)
                .font(.footnote)
                .multilineTextAlignment(.leading)
              Toggle(isOn: $isOnboarding) {
                if isOnboarding {
                  Text("Restarted".uppercased())
                    .foregroundColor(.green)
                    .fontWeight(.bold)
                } else {
                  Text("Restart".uppercased())
                    .foregroundColor(.secondary)
                    .fontWeight(.bold)
                }
              }
              .padding()
              .background(Color(UIColor.tertiarySystemBackground))
              .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            
            // MARK: - SECTION 3
            
            GroupBox(
              label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
            ) {
              SettingsRowView(name: "Developer", content: "Sahan Kaushalya")
              SettingsRowView(name: "Desginer", content: "Sahan Kaushalya")
              SettingsRowView(name: "Compatibility", content: "ios 14")
              SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
              SettingsRowView(name: "Twitter", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
              SettingsRowView(name: "SwiftUI", content: "3.0")
              SettingsRowView(name: "Version", content: "1.1.0")
            }
          }//: VSTACK
          .navigationBarTitle(Text("Settings"), displayMode: .large)
          .navigationBarItems(
            trailing: Button(action: {
              presentationMode.wrappedValue.dismiss()
            }) {
              Image(systemName: "xmark")
            }
          )
          .padding()
        }//: SCROLL
      }//: NAVIGATION
    }//: BODY
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
      SettingsView()
        .preferredColorScheme(.dark)
    }
}
