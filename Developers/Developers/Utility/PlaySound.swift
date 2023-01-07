//
//  PlaySound.swift
//  Developers
//
//  Created by Sahan Walpita on 2022-09-19.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      audioPlayer?.play()
    } catch {
      print("Could not find and play sound file")
    }
  }
}
