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
    @State var topcharts: [Article] = Bundle.main.decode("topcharts.json")
    @State var wines: [Article] = Bundle.main.decode("wines.json")
    @State var foods: [Article] = Bundle.main.decode("foods.json")
    @State var lifestyle: [Article] = Bundle.main.decode("lifestyle.json")
    
    var animation: Namespace.ID
    @EnvironmentObject var detail: DetailViewModel
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
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
                        topcharts.shuffle()
                        wines.shuffle()
                        foods.shuffle()
                        lifestyle.shuffle()
                        
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

//struct TopchartsView_Previews: PreviewProvider {
//    static var animation: Namespace. = <#initializer#>ID
//
//    static var previews: some View {
//        TopchartsView(animation: animation)
//    }
//}
