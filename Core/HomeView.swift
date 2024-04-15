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
            Text("Netflix")
                .foregroundStyle(.netflixRed)
        }
    }
}

#Preview {
    HomeView()
}
