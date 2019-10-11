//
//  EventDetailRow.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import SwiftUI

struct EventRow: View {
  private let viewModel: EventRowViewModel
  
  init(viewModel: EventRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View { 
    HStack {
      Image("eventPlaceholder")
        .resizable()
        .frame(width: 60, height: 60, alignment: .center)
        .aspectRatio(contentMode: .fit)
        .cornerRadius(10)
        .padding([.trailing], 10)
      
      VStack(alignment: .leading) {
        Text(viewModel.title).bold().lineLimit(1)
        Text(viewModel.location).font(.footnote).foregroundColor(.gray).padding([.top, .bottom], 4)
        Text(viewModel.date).font(.footnote).foregroundColor(.gray)
      }.padding([.top, .bottom], 10)
    }
  }
}
