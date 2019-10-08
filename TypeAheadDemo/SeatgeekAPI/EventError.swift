//
//  EventError.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import Foundation

enum EventError: Error {
  case parsing(description: String)
  case network(description: String)
}
