//
//  SampleData.swift
//  Ratings
//
//  Created by Harrison Borges on 5/21/18.
//  Copyright © 2018 steezydanks. All rights reserved.
//

import Foundation

final class SampleData {
  static func generatePlayerData() -> [Player] {
    return [
      Player(name: "Bob", game: "Space Invaders", rating: 4),
      Player(name: "Mark", game: "Donkey Kong", rating: 2),
      Player(name: "Vladimir", game: "World Domination", rating: 5)
    ]
  }
  
  static func generateRatings() -> [String] {
    return [
      "1 Star",
      "2 Stars",
      "3 Stars",
      "4 Stars",
      "5 Stars"
    ]
  }
}
