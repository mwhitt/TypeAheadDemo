//
//  EventListViewModel.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import SwiftUI
import Combine

class EventListViewModel: ObservableObject {
  
  @Published var filter: String = ""
  @Published var dataSource: [EventRowViewModel] = []
  
  private let eventFetcher: EventFetchable
  private var disposables = Set<AnyCancellable>()
  
  init(
    eventFetcher: EventFetchable,
    scheduler: DispatchQueue = DispatchQueue(label: "EventListViewModel")
  ) {
    self.eventFetcher = eventFetcher
    
    _ = $filter
      .dropFirst(1)
      .debounce(for: .seconds(0.5), scheduler: scheduler)
      .sink(receiveValue: fetchEvents(usingFilter:))
  }
  
  func fetchEvents(usingFilter filter: String) {
    guard filter.count > 0 else {
      DispatchQueue.main.async { [weak self] in
        self?.dataSource = []
      }
      return
    }
    
    eventFetcher.allEvents(usingFilter: filter)
    .map { response in
      response.events.map(EventRowViewModel.init)
    }
    .receive(on: DispatchQueue.main)
    .sink(
      receiveCompletion: { [weak self] value in
        guard let self = self else { return }
        switch value {
        case .failure:
          self.dataSource = []
        case .finished:
          break
        }
      },
      receiveValue: { [weak self] results in
        guard let self = self else { return }
        self.dataSource = results
    })
    .store(in: &disposables)
  }
  
}
