//
//  ArticleListItemView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 17/05/2021.
//

import SwiftUI

struct ArticleListItemView: View {
    // MARK: - Properties
    let article: Article
    
    var animation: Namespace.ID
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            RemoteImage(url: article.image)
                .scaledToFill()
                .frame(width: 75, height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .primary.opacity(0.4), radius: 3)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(article.footnote)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
            .foregroundColor(.primary)
            .minimumScaleFactor(0.1)
        }
        .padding(.vertical, 5)
    }
}

// MARK: - Preview

//struct ArticleListItemView_Previews: PreviewProvider {
//    static let articles: [Article] = Bundle.main.decode("articles.json")
//
//    static var previews: some View {
//        ArticleListItemView(article: articles[0])
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
