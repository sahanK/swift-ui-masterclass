//
//  MapView.swift
//  Africa
//
//  Created by Sahan Kaushalya on 2022-09-03.
//

import SwiftUI
import MapKit

struct MapView: View {
  // MARK: - Properties
  
  @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0))
  
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  
  // MARK: - Body
  
  var body: some View {
    // MARK: - BASIC MAP
//    Map(coordinateRegion: $region)
    
    // MARK: - ADVANCED MAP
    Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
      // (A) PIN: OLD STYLE (always static)
      // MapPin(coordinate: item.location, tint: .accentColor)
      
      // (B) MARKER: NEW STYLE (always static)
      // MapMarker(coordinate: item.location, tint: .accentColor)
      
      // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
//      MapAnnotation(coordinate: item.location) {
//        Image("logo")
//          .resizable()
//          .scaledToFit()
//          .frame(width: 32, height: 32, alignment: .center)
//      }//: ANNOTATION
      
      // (C) CUSTOM COMPLEX ANNOTATION (it could be interactive)
      MapAnnotation(coordinate: item.location) {
        MapAnnotationView(location: item)
      }
    })//: MAP
    .overlay(
      HStack(alignment: .center, spacing: 12) {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 48, height: 48, alignment: .center)
        
        VStack(alignment: .leading, spacing: 3) {
          HStack {
            Text("Latitude")
              .font(.footnote)
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
            Spacer()
            Text("\(region.center.latitude)")
              .font(.footnote)
              .foregroundColor(.white)
              .fontWeight(.bold)
          }
          
          Divider()
          
          HStack {
            Text("Longitude")
              .font(.footnote)
              .foregroundColor(.accentColor)
              .fontWeight(.bold)
            Spacer()
            Text("\(region.center.longitude)")
              .font(.footnote)
              .foregroundColor(.white)
              .fontWeight(.bold)
          }
        }
      }//: HSTACK
      .padding(.vertical, 12)
      .padding(.horizontal, 16)
      .background(.black.opacity(0.6))
      .cornerRadius(8)
      .padding()
      
      , alignment: .top
    )
  }
}

// MARK: - Preview

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MapView()
    }
  }
}
