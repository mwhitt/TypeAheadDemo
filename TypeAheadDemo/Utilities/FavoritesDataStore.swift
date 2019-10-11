//
//  FavoritesDataStore.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/11/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import Foundation
import SwiftUI

class FavoritesDataStore: ObservableObject {
  
  let storageKey = "favoriteEventIDs"
  let defaults = UserDefaults.standard
  
  init() {
    guard let favorites = defaults.array(forKey: storageKey) as? [Int] else { return }
    self.favorites = favorites
  }
  
  @Published var favorites: [Int] = [] {
    didSet {
      defaults.set(favorites, forKey: storageKey)
      defaults.synchronize()
    }
  }
  
}
