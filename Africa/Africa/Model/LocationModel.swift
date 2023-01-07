//
//  LocationModel.swift
//  Africa
//
//  Created by Sahan Walpita on 2022-09-06.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
  let id: String
  let name: String
  let image: String
  let latitude: Double
  let longitude: Double
  
  // Computed property
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
