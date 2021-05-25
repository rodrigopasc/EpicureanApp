//
//  MainView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 02/05/2021.
//

import SwiftUI

struct MainView: View {
    // MARK: - Properties
    
    @Namespace var animation
    @StateObject var detailTodayObject = DetailViewModel()
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            TabView {
                TodayTabView(animation: animation)
                    .environmentObject(detailTodayObject)
                    .tabItem {
                        Image(systemName: "newspaper")
                        Text("Hoje")
                    }
                
                TopchartsTabView(animation: animation)
                    .environmentObject(detailTodayObject)
                    .tabItem {
                        Image(systemName: "star")
                        Text("Destaques")
                    }
                
                ArticlesTabView(animation: animation)
                    .environmentObject(detailTodayObject)
                    .tabItem {
                        Image(systemName: "square.fill.text.grid.1x2")
                        Text("Artigos")
                    }
                
                SettingsTabView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Ajustes")
                    }
            }
            .opacity(detailTodayObject.show ? 0 : 1)
            
            if detailTodayObject.show {
                ArticleDetailView(detail: detailTodayObject, animation: animation)
            }
        }
    }
}

// MARK: - Preview

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView()
//    }
//}
