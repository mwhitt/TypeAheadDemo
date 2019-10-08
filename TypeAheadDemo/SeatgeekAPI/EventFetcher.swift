//
//  EventFetcher.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import Foundation
import Combine

protocol EventFetchable {
    
  func allEvents(
    usingFilterString filter: String
  ) -> AnyPublisher<EventListResponse, EventError>

  func eventDetails(
    forID id: String
  ) -> AnyPublisher<EventDetailResponse, EventError>
  
}

class EventFetcher {
    
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
}

// MARK: - EventFetchable

extension EventFetcher: EventFetchable {
    
  func allEvents(usingFilterString filter: String) -> AnyPublisher<EventListResponse, EventError> {
    return fetch(with: makeEventListComponents(usingFilterString: filter))
  }
  
  func eventDetails(forID id: String) -> AnyPublisher<EventDetailResponse, EventError> {
    return fetch(with: makeEventDetailComponents(withID: id))
  }
  
  private func fetch<T>(
    with components: URLComponents
  ) -> AnyPublisher<T, EventError> where T: Decodable {
    guard let url = components.url else {
      let error = EventError.network(description: "Couldn't create URL")
      return Fail(error: error).eraseToAnyPublisher()
    }
    return session.dataTaskPublisher(for: URLRequest(url: url))
    .mapError { error in
      .network(description: error.localizedDescription)
    }
    .flatMap(maxPublishers: .max(1)) { pair in
      decode(pair.data)
    }
    .eraseToAnyPublisher()
  }
}

// MARK: - Seatgeek API

private extension EventFetcher {
    
  struct SeatgeekAPI {
    static let scheme = "https"
    static let host = "api.seatgeek.com"
    static let path = "/2/events"
    static let key: String = try! Configuration.value(for: "SEATGEEK_API_CLIENT_ID")
  }
  
  func makeEventListComponents(
    usingFilterString filter: String
  ) -> URLComponents {
    var components = URLComponents()
    components.scheme = SeatgeekAPI.scheme
    components.host = SeatgeekAPI.host
    components.path = SeatgeekAPI.path
    
    components.queryItems = [
      URLQueryItem(name: "q", value: filter),
      URLQueryItem(name: "client_id", value: SeatgeekAPI.key)
    ]
    
    return components
  }
  
  func makeEventDetailComponents(
    withID id: String
  ) -> URLComponents {
    var components = URLComponents()
    components.scheme = SeatgeekAPI.scheme
    components.host = SeatgeekAPI.host
    components.path = SeatgeekAPI.path + "/\(id)"
    
    components.queryItems = [
      URLQueryItem(name: "client_id", value: SeatgeekAPI.key)
    ]
    
    return components
  }
    
}


