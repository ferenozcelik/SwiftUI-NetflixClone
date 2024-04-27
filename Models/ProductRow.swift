//
//  ProductRow.swift
//  NetflixClone
//
//  Created by Fatih Eren Ozcelik on 27.04.2024.
//

import Foundation

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
    
}
