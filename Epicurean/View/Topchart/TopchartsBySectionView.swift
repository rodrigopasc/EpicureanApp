//
//  TopchartBySectionsView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 03/05/2021.
//

import SwiftUI

struct TopchartsBySectionView: View {
    // MARK: - Properties
    
    @EnvironmentObject var detail: DetailViewModel
    
    let articles: [Article]
    let sectionTitle: String
    
    var animation: Namespace.ID
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            SectionTitleView(title: sectionTitle)
            
            ScrollView(.horizontal, showsIndicators: false) {
                Spacer()
                
                TopchartArticleCardView(articles: articles, size: 200, detailedCard: false, animation: animation)
                
                Spacer()
            }
        }
    }
}

// MARK: - Preview

//struct TopchartBySectionsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopchartBySectionsView()
//    }
//}
