//
//  ArticleListView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 02/05/2021.
//

import SwiftUI

struct ArticlesTabView: View {
    // MARK: - Properties
    @EnvironmentObject var detail: DetailViewModel
    
    @State var articles: [Article] = Bundle.main.decode("articles.json")
    
    let haptic = UIImpactFeedbackGenerator(style: .light)
    
    var animation: Namespace.ID
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                ForEach(articles) { article in
                    ArticleListItemView(article: article, animation: animation)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.75, dampingFraction: 0.725, blendDuration: 0.9)) {
                                detail.selectedItem = article
                                detail.show.toggle()
                                
                                haptic.impactOccurred()
                            }
                        }
                }
            }
            .navigationBarTitle("Artigos", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        articles.shuffle()
                        
                        haptic.impactOccurred()
                    }) {
                        Image(systemName: "arrow.triangle.2.circlepath")
                    }
                }
            }
        }
    }
}

// MARK: - Preview

//struct ArticlesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticlesTabView()
//    }
//}
