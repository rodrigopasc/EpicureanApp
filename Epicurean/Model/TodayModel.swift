//
//  TodayModel.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 02/05/2021.
//

import Foundation

struct Today: Codable, Identifiable {
    let id: Int
    let title: String
    let subtitle: String
    let footnote: String
    let image: String
}
