//
//  TodayView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 02/05/2021.
//

import SwiftUI

struct TodayTabView: View {
    // MARK: - Properties
    let haptic = UIImpactFeedbackGenerator(style: .light)
    
    @State var todayArticles: [Article] = []
    @State var error: Bool = false
    
    @EnvironmentObject var detail: DetailViewModel
    
    var animation: Namespace.ID
    
    // MARK: - Functions
    
    func getTodaysFeed() {
        ArticleApi().getTodaysFeed() { (result: Result<[Article], ArticleApi.APIServiceError>) in
            switch result {
                case .success(let todayArticles):
                    self.todayArticles = todayArticles
                    
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
        getTodaysFeed()
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            if error {
                ErrorPlaceholderView(action: getData)
            } else {
                if todayArticles.isEmpty {
                    LoadingPlaceholderView()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 5) {
                            ForEach(todayArticles) { today in
                                ArticleCardView(article: today, size: 480, animation: animation)
                                    .onTapGesture {
                                        withAnimation(.interactiveSpring(response: 0.75, dampingFraction: 0.725, blendDuration: 0.9)) {
                                            detail.selectedItem = today
                                            detail.show.toggle()
                                            
                                            haptic.impactOccurred()
                                        }
                                    }
                            }
                        }
                    }
                    .navigationBarTitle("Hoje", displayMode: .large)
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

//struct TodayView_Previews: PreviewProvider {
//    static var animation: Namespace.ID
//    
//    static var previews: some View {
//        TodayView(animation: animation)
//    }
//}
