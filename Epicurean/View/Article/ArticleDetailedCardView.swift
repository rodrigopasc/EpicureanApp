//
//  ArticleSlimCardView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 05/05/2021.
//

import SwiftUI

struct ArticleDetailedCardView: View {
    // MARK: - Properties
    
    let article: Article
    let size: CGFloat
    
    var animation: Namespace.ID
    
    @State private var backgroundColor: Color = .clear
    
    // MARK: - Functions
    
    private func setAverageColor() {
        let uiColor = UIImage(named: article.image)?.averageColor ?? .black
        backgroundColor = Color(uiColor)
    }
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .bottom) {
            RemoteImage(url: article.image)
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(width: size - 75, height: size, alignment: .center)
//                .matchedGeometryEffect(id: article.image, in: animation)
            
            ZStack(alignment: .center) {
                RadialGradient(gradient: Gradient(colors: [Color.clear, Color.clear]), center: .top, startRadius: 5, endRadius: 500)
                    .frame(height: 90)
                    .background(Blur(style: .systemUltraThinMaterial))
                    .matchedGeometryEffect(id: article.image + "shadow", in: animation)


                Text(article.footnote)
                    .font(.caption2)
                    .lineLimit(2)
                    .truncationMode(.tail)
                    .foregroundColor(.black)
                    .padding()
                    .minimumScaleFactor(0.05)
//                    .matchedGeometryEffect(id: article.footnote + article.title, in: animation)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 90)
        }
        .cornerRadius(12)
        .shadow(color: .primary.opacity(0.4), radius: 8)
        .padding()
        .matchedGeometryEffect(id: article.footnote + article.title + "box", in: animation)
        .onAppear {
            self.setAverageColor()
        }
    }
}

// MARK: - Preview

//struct ArticleSlimCardView_Previews: PreviewProvider {
//    static var articles: [Article] = Bundle.main.decode("topcharts.json")
//    static var previews: some View {
//        ArticleDetailedCardView(article: articles.shuffled()[0])
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}
