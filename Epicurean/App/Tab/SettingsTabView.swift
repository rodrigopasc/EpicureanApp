//
//  SettingsView.swift
//  Epicurean
//
//  Created by Rodrigo Paschoaletto on 02/05/2021.
//

import SwiftUI

struct SettingsTabView: View {
    // MARK: - Properties
    
    @AppStorage("isCacheOfflineOn") var isCacheOfflineOn: Bool = true
    @AppStorage("isNotificationsOn") var isNotificationsOn: Bool = true
    @AppStorage("isAutoRefreshOn") var isAutoRefreshOn: Bool = true
    @AppStorage("isContinuityOn") var isContinuityOn: Bool = true
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    Spacer()
                    
                    GroupBox(
                        label: SettingsLabelView(label: "Sobre", icon: "info")
                    ) {
                        Divider()
                        
                        HStack(alignment: .center, spacing: 10) {
                            Text("🤌")
                                .font(.title)
                                .frame(width: 65, height: 65)
                                .background(Color(red: 144 / 255, green: 238 / 255, blue: 144 / 255))
                                .cornerRadius(12)
                                .shadow(color: .primary.opacity(0.4), radius: 2)
                        
                            Text("Lorem ipsum dolor amet am ipsum lorem clear donam a ipsum. Maecenas massa magna, condimentum ut. Nullam quis tellus eget lectus.")
                                .font(.footnote)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    
                    GroupBox(
                        label: SettingsLabelView(label: "Preferências", icon: "gear")
                    ) {
                        SettingsToggleView(title: "Salvar offline", isToggleOn: isCacheOfflineOn)
                        SettingsToggleView(title: "Notificações", isToggleOn: isNotificationsOn)
                        SettingsToggleView(title: "Atualizar automaticamente", isToggleOn: isAutoRefreshOn)
                        SettingsToggleView(title: "Continuidade entre dispositivos", isToggleOn: isContinuityOn)
                    }
                    
                    GroupBox(
                        label: SettingsLabelView(label: "Aplicação", icon: "apps.iphone")
                    ) {
                        SettingsRowView(title: "Versão", content: "0.0.1-alpha1")
                    }
                    
                    GroupBox(
                        label: SettingsLabelView(label: "Desenvolvedor", icon: "person")
                    ) {
                        SettingsRowView(title: "Mobile", content: "Rodrigo Paschoaletto")
                        SettingsRowView(title: "Back-end", content: "Rodrigo Paschoaletto")
                        SettingsRowView(title: "Website", linkLabel: "rodrigo.paschoaletto.com", linkURL: "https://rodrigo.paschoaletto.com")
                        SettingsRowView(title: "Contato", content: "rodrigo@paschoaletto.com")
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Ajustes", displayMode: .large)
        }
    }
}

// MARK: - Preview

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsTabView()
//    }
//}
