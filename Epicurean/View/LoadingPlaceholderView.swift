//
//  LoadingPlaceholderView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 08/07/2021.
//

import SwiftUI

struct LoadingPlaceholderView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            ProgressView()
            
            Text("Carregando... ⏳")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

//struct LoadingPlaceholderView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingPlaceholderView()
//    }
//}
