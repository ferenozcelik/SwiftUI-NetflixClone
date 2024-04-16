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
    var selectedFilter: Filter? = nil
    var onFilterPressed: ((Filter) -> Void)? = nil
    var onXMarkPressed: (() -> Void)? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                if selectedFilter != nil {
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
                        .transition(AnyTransition.move(edge: .leading))
                        .padding(.leading, 16)
                }
                
                ForEach(filters, id: \.self) { filter in
                    if selectedFilter == nil || selectedFilter == filter {
                        FilterView(
                            title: filter.title,
                            isDropdown: filter.isDropdown,
                            isSelected: selectedFilter == filter
                        )
                        .background(.black.opacity(0.0001))
                        .onTapGesture {
                            onFilterPressed?(filter)
                        }
                        .padding(.leading, ((selectedFilter == nil) &&
                                            (filter == filters.first)) ? 16 : 0)
                    }
                }
            }
            .padding(.vertical, 4)
        }
        .scrollIndicators(.hidden)
        .animation(.bouncy, value: selectedFilter)
    }
}

fileprivate struct FilterBarViewPreview: View {
    
    @State private var filters = Filter.mockData
    @State private var selectedFilter: Filter? = nil
    
    var body: some View {
        FilterBarView(
            filters: filters,
            selectedFilter: selectedFilter,
            onFilterPressed: { newFilter in
                selectedFilter = newFilter
            },
            onXMarkPressed: {
                selectedFilter = nil
            }
        )
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        FilterBarViewPreview()
    }
}
