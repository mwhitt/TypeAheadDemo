//
//  Responses.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import Foundation

struct EventListResponse: Codable {
  let events: [Event]
  
  struct Event: Codable {
    let date: Date
    let title: String
    let id: Int
    let venue: Venue
    
    enum CodingKeys: String, CodingKey {
      case date = "datetime_local"
      case title
      case id
      case venue
    }
  }
  
  struct Venue: Codable {
    let location: String
    
    enum CodingKeys: String, CodingKey {
      case location = "display_location"
    }
  }
}

struct EventDetailResponse: Decodable {
  let date: Date
  let title: String
  let id: Int
  let venue: Venue
  
  enum CodingKeys: String, CodingKey {
    case date = "datetime_local"
    case title
    case id
    case venue
  }
    
  struct Venue: Codable {
    let location: String
  
    enum CodingKeys: String, CodingKey {
      case location = "display_location"
    }
  }
}
