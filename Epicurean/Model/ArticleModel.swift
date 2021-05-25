//
//  FeaturedModel.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 02/05/2021.
//

import Foundation

struct Article: Codable, Identifiable {
    let id: Int
    let title: String
    let subtitle: String
    let footnote: String
    let image: String
}
