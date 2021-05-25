//
//  TopchardArticleCardView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 03/05/2021.
//

import SwiftUI

struct TopchartArticleCardView: View {
    // MARK: - Properties
    
    @EnvironmentObject var detail: DetailViewModel
    
    let haptic = UIImpactFeedbackGenerator(style: .light)
    let articles: [Article]
    let size: CGFloat
    let detailedCard: Bool
    
    var animation: Namespace.ID
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            ForEach(articles) { article in
                if detailedCard {
                    ArticleDetailedCardView(article: article, size: size, animation: animation)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.75, dampingFraction: 0.725, blendDuration: 0.9)) {
                                detail.selectedItem = article
                                detail.show.toggle()
                                
                                haptic.impactOccurred()
                            }
                        }
                } else {
                    ArticleCardView(article: article, size: size, animation: animation)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.75, dampingFraction: 0.725, blendDuration: 0.9)) {
                                detail.selectedItem = article
                                detail.show.toggle()
                                
                                haptic.impactOccurred()
                            }
                        }
                }
            }
        }
    }
}

// MARK: - Preview

//struct TopchardArticleCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopchartArticleCardView()
//    }
//}
