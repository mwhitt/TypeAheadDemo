//
//  EventListView.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/7/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import SwiftUI

struct EventListView: View {
  @ObservedObject var viewModel: EventListViewModel

    init(viewModel: EventListViewModel) {
      self.viewModel = viewModel
    }
    
    var body: some View {
      NavigationView {
        List {
          searchField
          if viewModel.dataSource.isEmpty {
            emptySection
          } else {
            listSection
          }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Events 🎫")
      }
    }
  }

  private extension EventListView {
    
    var searchField: some View {
      HStack(alignment: .center) {
        TextField("Search by team, artist, event or venue", text: $viewModel.filter) {
          UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
      }
    }

    var listSection: some View {
      Section {
        ForEach(viewModel.dataSource, id: \.self) { viewModel in
          NavigationLink(destination: EventDetailView(viewModel: viewModel)) {
            EventRow.init(viewModel: viewModel)
          }
        }
      }
    }

    var emptySection: some View {
      Section {
        Text("No results")
          .foregroundColor(.gray)
      }
    }
    
}

