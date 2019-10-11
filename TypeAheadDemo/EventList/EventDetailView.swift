//
//  EventDetailView.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/8/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
  var viewModel: EventRowViewModel

  init(viewModel: EventRowViewModel) {
    self.viewModel = viewModel
  }

  var body: some View {
    VStack(alignment: .leading) {
      Text(viewModel.title)
        .lineLimit(nil)
        .font(.title)
        .padding([.top, .leading, .trailing], 20)
      
      Divider()
        .padding([.leading, .trailing, .bottom], 20)
      
      Image("eventPlaceholder")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 230, alignment: .center)
        .cornerRadius(10)
        .padding([.trailing, .leading, .bottom], 20)
      
      VStack(alignment: .leading, spacing: 5) {
        Text(viewModel.date)
          .bold()
        
        Text(viewModel.location)
          .font(.footnote)
          .foregroundColor(.gray)
      }
      .padding([.leading, .trailing], 20)
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    .navigationBarTitle("", displayMode: .inline)
  }
}
