//
//  InsetMapView.swift
//  Africa
//
//  Created by Sahan Kaushalya on 2022-09-04.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
  // MARK: - Properties
  
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
  
  // MARK: Body
  
  var body: some View {
    Map(coordinateRegion: $region)
    .overlay(
      NavigationLink(destination: MapView()) {
        HStack {
          Image(systemName: "mappin.circle")
            .imageScale(.large)
            .foregroundColor(.white)
          Text("Locations")
            .foregroundColor(.accentColor)
            .fontWeight(.bold)
        }//: HSTACK
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .background(.black.opacity(0.4))
        .cornerRadius(8)
      }//: NAVIGATION
        .padding(12),
      alignment: .topTrailing
    )
    .frame(height: 256)
    .cornerRadius(12)
  }
}

// MARK: - Preview

struct InsetMapView_Previews: PreviewProvider {
  static var previews: some View {
      InsetMapView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
