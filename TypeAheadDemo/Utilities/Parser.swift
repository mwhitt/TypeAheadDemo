//
//  Parse.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, EventError> {
  let decoder = JSONDecoder()
  let formatter = DateFormatter()
  formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
  decoder.dateDecodingStrategy = .formatted(formatter)

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { error in
      .parsing(description: error.localizedDescription)
    }
    .eraseToAnyPublisher()
}
