//
//  EventDetailViewModel.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import Foundation
import SwiftUI

struct EventDetailRowViewModel: Identifiable {
  
  private let event: EventListResponse.Event
  
  var id: Int {
    return event.id
  }
  
  var title: String {
    return event.title
  }
  
  var location: String {
    return event.venue.location
  }
  
  var date: String {
    return dayFormatter.string(from: event.date)
  }

  init(event: EventListResponse.Event) {
    self.event = event
  }
  
}
