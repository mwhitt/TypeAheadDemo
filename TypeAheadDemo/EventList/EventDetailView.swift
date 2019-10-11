//
//  EventDetailView.swift
//  TypeAheadDemo
//
//  Created by Matthew Whittaker on 10/8/19.
//  Copyright © 2019 One Stream Ventures. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
  
  @EnvironmentObject var dataStore: FavoritesDataStore
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
      
      if dataStore.favorites.contains(viewModel.id) {
        favoriteImage(name: "heart.fill")
          .foregroundColor(.red)
          .onTapGesture {
            var favorites = self.dataStore.favorites
            favorites.removeAll{$0 == self.viewModel.id}
            self.dataStore.favorites = favorites
        }
      } else {
        favoriteImage(name: "heart")
          .onTapGesture {
            self.dataStore.favorites += [self.viewModel.id]
        }
      }
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    .navigationBarTitle("", displayMode: .inline)
  }
  
  private func favoriteImage(name: String) -> some View {
    Image(systemName: name)
      .resizable()
      .aspectRatio(contentMode: .fit)
      .frame(width: 30, height: 30, alignment: .center)
      .padding([.leading, .top], 20)
  }
}
