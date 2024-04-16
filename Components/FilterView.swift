//
//  FilterView.swift
//  NetflixClone
//
//  Created by Fatih Eren Ozcelik on 16.04.2024.
//

import SwiftUI

struct FilterView: View {
    
    var title: String = "Categories"
    var isDropdown: Bool = true
    var isSelected: Bool = false
    
    var body: some View {
        HStack(spacing: 4) {
            Text(title)
            
            if isDropdown {
                Image(systemName: "chevron.down")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(
            ZStack {
                if isSelected {
                    Capsule(style: .circular)
                        .fill(.netflixDarkGray)
                }
                
                Capsule(style: .circular)
                    .stroke(lineWidth: 1)
            }
        )
        .foregroundStyle(.netflixLightGray)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack {
            FilterView()
            FilterView(isSelected: true)
            FilterView(isDropdown: false)
        }
    }
}
