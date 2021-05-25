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
    
    @State var todayArticles: [Article] = Bundle.main.decode("today.json")
    
    @EnvironmentObject var detail: DetailViewModel
    
    var animation: Namespace.ID
    
    // MARK: - Body
    var body: some View {
        NavigationView {
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
                        todayArticles.shuffle()
                        
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

//struct TodayView_Previews: PreviewProvider {
//    static var animation: Namespace.ID
//    
//    static var previews: some View {
//        TodayView(animation: animation)
//    }
//}
