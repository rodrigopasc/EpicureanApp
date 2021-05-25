//
//  DetailViewModel.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 03/05/2021.
//

import SwiftUI

class DetailViewModel: ObservableObject {
    @Published var selectedItem = Article(id: 0, title: "", subtitle: "", footnote: "", image: "")
    @Published var show = false
    
    func reset() {
        self.selectedItem = Article(id: 0, title: "", subtitle: "", footnote: "", image: "")
    }
}
