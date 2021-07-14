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
    
    @State var articles: [Article] = []
    @State var error: Bool = false
    
    let haptic = UIImpactFeedbackGenerator(style: .light)
    
    var animation: Namespace.ID
    
    // MARK: - Functions
    
    func getArticles() {
        ArticleApi().getArticles() { (result: Result<[Article], ArticleApi.APIServiceError>) in
            switch result {
                case .success(let articles):
                    self.articles = articles
                    
                    if self.error {
                        self.error.toggle()
                    }
                case .failure(let error):
                    print("test:", error)
                    self.error.toggle()
                    
                    if !self.error {
                        self.error.toggle()
                    }
            }
        }
    }
    
    func getData() {
        getArticles()
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            if error {
                ErrorPlaceholderView(action: getData)
            } else {
                if articles.isEmpty {
                    LoadingPlaceholderView()
                } else {
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
                                getData()
                                
                                haptic.impactOccurred()
                            }) {
                                Image(systemName: "arrow.triangle.2.circlepath")
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            getData()
        }
    }
}

// MARK: - Preview

//struct ArticlesView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticlesTabView()
//    }
//}
