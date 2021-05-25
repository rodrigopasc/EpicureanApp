//
//  SettingsToggleView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 25/05/2021.
//

import SwiftUI

struct SettingsToggleView: View {
    // MARK: - Properties
    var title: String
    @State var isToggleOn: Bool
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Divider()
            
            Toggle(title, isOn: $isToggleOn)
        }
    }
}

// MARK: - Preview

//struct SettingsToggleView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsToggleView()
//    }
//}
