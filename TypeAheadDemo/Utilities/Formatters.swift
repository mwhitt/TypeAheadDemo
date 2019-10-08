//
//  Formatters.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import Foundation

import Foundation

let dayFormatter: DateFormatter = {
  let formatter = DateFormatter()
  formatter.dateFormat = "E, d MMM yyyy h:mm a"
  return formatter
}()
