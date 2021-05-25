//
//  SectionTitleView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 03/05/2021.
//

import SwiftUI

struct SectionTitleView: View {
    // MARK: - Properties
    
    let title: String
    
    // MARK: - Body
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.bold)
            .padding(.horizontal)
    }
}

// MARK: - Preview

//struct SectionTitleView_Previews: PreviewProvider {
//    static var previews: some View {
//        SectionTitleView()
//    }
//}
