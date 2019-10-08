//
//  EventDetailRow.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import SwiftUI

struct EventDetailRow: View {
  private let viewModel: EventDetailRowViewModel
  
  init(viewModel: EventDetailRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      Text(viewModel.title).bold().lineLimit(0)
      Text(viewModel.location).font(.footnote).foregroundColor(.gray)
      Text(viewModel.date).font(.footnote).foregroundColor(.gray)
    }
  }
}
