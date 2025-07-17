//
//  TabBarView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            
            
            InspirationsView()
                .tabItem {
                    Label("Inspirations", image: "shooting-star")
                }
            
            
            ArticlesView()
                .tabItem {
                    Label("Articles", image: "newspaper-clipping")
                }
            
            DashboardView()
                .tabItem {
                    Label("Dashboard", image: "code")
                }
            
            ForumView()
                .tabItem {
                    Label("Forum", image: "chat-circle-text")
                }
            
            EventsView()
                .tabItem {
                    Label("Events", image: "calendar-dots")
                }
            
        }
      
    }}

#Preview {
    TabBarView()
}
