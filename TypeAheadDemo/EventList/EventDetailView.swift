//
//  EventDetailView.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/8/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
  var viewModel: EventDetailRowViewModel

  init(viewModel: EventDetailRowViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    List(content: content)
      .navigationBarTitle(viewModel.title)
      .listStyle(GroupedListStyle())
  }
  
  func content() -> some View {
    Text("BOOM!")
  }
}
