//
//  Constant.swift
//  Devote
//
//  Created by Sahan Walpita on 2022-09-10.
//

import SwiftUI

// MARK: - FORMATTER

let itemFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateStyle = .short
  formatter.timeStyle = .medium
  return formatter
}()

// MARK: - UI

var backgroundGradient: LinearGradient {
  return LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

// MARK: - UX

let haoticFeedback = UIImpactFeedbackGenerator()
