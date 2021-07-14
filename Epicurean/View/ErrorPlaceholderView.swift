//
//  ErrorPlaceholderView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 08/07/2021.
//

import SwiftUI

struct ErrorPlaceholderView: View {
    let action: () -> Void
    let haptic = UIImpactFeedbackGenerator(style: .light)
    
    var body: some View {
        VStack(alignment: .center, spacing: 10 ) {
            Text("Um erro inesperado aconteceu. 😔")
                .font(.caption)
                .foregroundColor(.gray)
            Text("Por gentileza, tente novamente mais tarde.")
                .font(.caption2)
                .foregroundColor(.gray)
            
            Button(action: {
                action()
                
                haptic.impactOccurred()
            }) {
                HStack(alignment: .center) {
                    Text("Tentar novamente")
                    Image(systemName: "arrow.triangle.2.circlepath")
                }
                .shadow(color: .primary.opacity(0.4), radius: 80)
            }
        }
        .padding()
    }
}

//struct ErrorPlaceholderView_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorPlaceholderView()
//    }
//}
