//
//  SettingsRowView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 20/05/2021.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - Properties
    
    var title: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkURL: String? = nil
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            Divider()
            
            HStack {
                Text(title)
                
                Spacer()
                
                if (content != nil) {
                    Text(content!)
                        .foregroundColor(.gray)
                } else if (linkLabel != nil && linkURL != nil) {
                    Link(linkLabel!, destination: URL(string: linkURL!)!)
                    
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.gray)
                } else {
                  EmptyView()
                }
            }
        }
    }
}

// MARK: - Preview

//struct SettingsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsRowView()
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
