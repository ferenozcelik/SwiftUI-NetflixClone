//
//  FilterBarView.swift
//  NetflixClone
//
//  Created by Fatih Eren Ozcelik on 16.04.2024.
//

import SwiftUI

struct Filter: Hashable, Equatable {
    let title: String
    let isDropdown: Bool
    
    static var mockData: [Filter] {
        [
            Filter(title: "TV Shows", isDropdown: false),
            Filter(title: "Movies", isDropdown: false),
            Filter(title: "Categories", isDropdown: true)
        ]
    }
}

struct FilterBarView: View {
    
    var filters: [Filter] = Filter.mockData
    var onXMarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                
                Image(systemName: "xmark")
                    .padding(8)
                    .background(
                        Circle()
                            .stroke(lineWidth: 1)
                    )
                    .foregroundStyle(.netflixLightGray)
                    .background(.black.opacity(0.0001))
                    .onTapGesture {
                        onXMarkPressed?()
                    }
                
                ForEach(filters, id: \.self) { filter in
                    FilterView(
                        title: filter.title,
                        isDropdown: filter.isDropdown,
                        isSelected: false
                    )
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        FilterBarView()
    }
}
