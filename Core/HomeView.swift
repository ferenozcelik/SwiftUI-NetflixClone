//
//  HomeView.swift
//  NetflixClone
//
//  Created by Fatih Eren Ozcelik on 15.04.2024.
//

import SwiftUI
import SwiftfulUI

struct HomeView: View {
    
    @State private var filters = Filter.mockData
    @State private var selectedFilter: Filter? = nil
    @State private var fullHeaderSize: CGSize = .zero
    @State private var heroProduct: Product? = nil
    
    @State private var currentUser: User? = nil
    @State private var productRows: [ProductRow] = []
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.netflixBlack.ignoresSafeArea()
            
            ScrollView(.vertical) {
                VStack(spacing: 8) {
                    
                    Rectangle()
                        .opacity(0)
                        .frame(height: fullHeaderSize.height)
                    
                    if let heroProduct {
                        HeroView(
                            imageName: heroProduct.firstImage,
                            isNetflixFilm: true,
                            title: heroProduct.title,
                            categories: [heroProduct.category.capitalized, heroProduct.brand],
                            onBackgroundPressed: {
                                
                            },
                            onPlayPressed: {
                                
                            },
                            onMyListPressed: {
                                
                            }
                        )
                        .padding(24)
                    }
                    
                    ForEach(0..<20) { _ in
                        Rectangle()
                            .fill(.red)
                            .frame(height: 200)
                    }
                }
            }
            .scrollIndicators(.hidden)
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                
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
                .padding(.top, 16)
            }
            .background(.blue)
            .readingFrame { frame in
                fullHeaderSize = frame.size
            }
        }
        .foregroundStyle(.netflixWhite)
        .task {
            await getData()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    HomeView()
}

private extension HomeView {
    
    var header: some View {
        HStack(spacing: 0) {
            Text("For You")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.title)
            
            HStack(spacing: 16) {
                Image(systemName: "tv.badge.wifi")
                    .onTapGesture { }
                
                Image(systemName: "magnifyingglass")
                    .onTapGesture { }
            }
            .font(.title2)
        }
    }
}

private extension HomeView {
    
    func getData() async {
        guard productRows.isEmpty else { return }
        // if products array is not empty, meaning it's already fetchted and filled with data, then return and don't fetch again
        do {
            currentUser = try await NetworkManager().getUsers().first
            let products = try await NetworkManager().getProducts()
            heroProduct = products.first
            
            var rows: [ProductRow] = []
            let allBrands = Set(products.map { $0.brand }) // unique brands
            for brand in allBrands {
//                let products = self.products.filter({ $0.brand == brand })
                rows.append(ProductRow(title: brand.capitalized, products: products))
            }
            productRows = rows
        } catch {
            
        }
    }
}
