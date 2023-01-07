//
//  HideKeyBoardExtension.swift
//  Devote
//
//  Created by Sahan Walpita on 2022-09-12.
//

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
