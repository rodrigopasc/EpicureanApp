//
//  ContentView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 02/05/2021.
//

import SwiftUI

struct TopchartsTabView: View {
    // MARK: - Preview
    let haptic = UIImpactFeedbackGenerator(style: .soft)
    @State var topcharts: [Article] = []
    @State var wines: [Article] = []
    @State var foods: [Article] = []
    @State var lifestyle: [Article] = []
    @State var error: Bool = false
    
    var animation: Namespace.ID
    @EnvironmentObject var detail: DetailViewModel
    
    // MARK: - Functions
    
    func getTopcharts() {
        ArticleApi().getTopcharts() { (result: Result<[Article], ArticleApi.APIServiceError>) in
            switch result {
                case .success(let topcharts):
                    self.topcharts = topcharts
                    
                    if self.error {
                        self.error.toggle()
                    }
                case .failure(let error):
                    print("test:", error)
                    
                    if !self.error {
                        self.error.toggle()
                    }
            }
        }
    }
    
    func getFood() {
        ArticleApi().getFood() { (result: Result<[Article], ArticleApi.APIServiceError>) in
            switch result {
                case .success(let foods):
                    self.foods = foods
                    
                    if self.error {
                        self.error.toggle()
                    }
                case .failure(let error):
                    print("test:", error)
                    
                    if !self.error {
                        self.error.toggle()
                    }
            }
        }
    }
    
    func getWine() {
        ArticleApi().getWine() { (result: Result<[Article], ArticleApi.APIServiceError>) in
            switch result {
                case .success(let wines):
                    self.wines = wines
                    
                    if self.error {
                        self.error.toggle()
                    }
                case .failure(let error):
                    print("test:", error)
                    
                    if !self.error {
                        self.error.toggle()
                    }
            }
        }
    }
    
    func getLifestyle() {
        ArticleApi().getLifestyle() { (result: Result<[Article], ArticleApi.APIServiceError>) in
            switch result {
                case .success(let lifestyle):
                    self.lifestyle = lifestyle
                case .failure(let error):
                    print("test:", error)
                    
                    if !self.error {
                        self.error.toggle()
                    }
            }
        }
    }
    
    func getData() {
        getTopcharts()
        getFood()
        getWine()
        getLifestyle()
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            if error {
                ErrorPlaceholderView(action: getData)
            } else {
                if topcharts.isEmpty || wines.isEmpty || foods.isEmpty || lifestyle.isEmpty {
                    LoadingPlaceholderView()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                Spacer()
                                
                                TopchartArticleCardView(articles: topcharts, size: 400, detailedCard: true, animation: animation)
                                
                                Spacer()
                            }
                            
                            Divider().padding()
                            
                            TopchartsBySectionView(articles: wines, sectionTitle: "Wine", animation: animation)
                            
                            Divider().padding()
                            
                            TopchartsBySectionView(articles: foods, sectionTitle: "Food", animation: animation)
                            
                            Divider().padding()
                            
                            TopchartsBySectionView(articles: lifestyle, sectionTitle: "Lifestyle", animation: animation)
                        }
                    }
                    .navigationBarTitle("Destaques", displayMode: .large)
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

//struct TopchartsView_Previews: PreviewProvider {
//    static var animation: Namespace. = <#initializer#>ID
//
//    static var previews: some View {
//        TopchartsView(animation: animation)
//    }
//}
