//
//  FeaturedItemView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 02/05/2021.
//

import SwiftUI

struct ArticleCardView: View {
    // MARK: - Properties
    
    let article: Article
    let size: CGFloat
    
    var animation: Namespace.ID
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            ZStack {
                Image(article.image)
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: size)
//                    .matchedGeometryEffect(id: article.image, in: animation)
                LinearGradient(gradient: Gradient(colors: [.clear, Color.black.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                
                VStack(alignment: .leading) {
                    Text(article.title.uppercased())
                        .fontWeight(.semibold)
                        .shadow(color: Color.primary.opacity(0.3), radius: 5)
//                        .matchedGeometryEffect(id: article.title + article.footnote, in: animation)
                    
                    Text(article.subtitle)
                        .font(.title)
                        .fontWeight(.bold)
                        .shadow(color: Color.primary.opacity(0.3), radius: 5)
//                        .matchedGeometryEffect(id: article.subtitle + article.footnote, in: animation)

                    Spacer()

                    Text(article.footnote)
                        .font(.footnote)
                        .shadow(color: Color.primary.opacity(0.3), radius: 5)
//                        .matchedGeometryEffect(id: article.footnote + article.title, in: animation)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .padding()
                .minimumScaleFactor(0.05)
                .frame(maxWidth: .infinity)
            }
        }
        .cornerRadius(25)
        .shadow(color: .primary.opacity(0.4), radius: 8)
        .frame(minHeight: size, idealHeight: size, maxHeight: size)
        .padding()
        .matchedGeometryEffect(id: article.footnote + article.title + "box", in: animation)
    }
}

// MARK: - Preview

//struct FeaturedItemView_Previews: PreviewProvider {
//    static var topcharts: [Topchart] = Bundle.main.decode("topcharts.json")
//    
//    static var animation: Namespace.ID
//    
//    static var previews: some View {
//        FeaturedItemView(topchart: topcharts[0], size: 300, animation: animation)
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
