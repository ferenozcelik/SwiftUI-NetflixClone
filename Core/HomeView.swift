//
//  HomeView.swift
//  NetflixClone
//
//  Created by Fatih Eren Ozcelik on 15.04.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.netflixBlack.ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                    .padding(.horizontal, 16)
                Spacer()
            }
        }
        .foregroundStyle(.netflixWhite)
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
