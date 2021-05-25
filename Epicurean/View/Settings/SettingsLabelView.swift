//
//  SettingsLabelView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 20/05/2021.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - Properties
    let label: String
    let icon: String
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            Text(label).fontWeight(.bold)
            
            Spacer()
            
            Image(systemName: icon)
        }
    }
}

// MARK: - Preview

//struct SettingsLabelView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsLabelView()
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
