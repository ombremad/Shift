//
//  TabItemViewModel.swift
//  Shift
//
//  Created by Samara Lima da Silva on 25/07/2025.
//

import Foundation

class TabBarViewModel: ObservableObject {
    @Published var selectedTab: Tab = .inspirations

    let tabs: [TabItem] = [
        TabItem(tab: .inspirations, icon: "shooting-star", title: "Inspirations"),
        TabItem(tab: .articles, icon: "newspaper-clipping", title: "Articles"),
        TabItem(tab: .dashboard, icon: "code", title: "Dashboard"),
        TabItem(tab: .forum, icon: "chat-circle-text", title: "Forum"),
        TabItem(tab: .events, icon: "calendar-dots", title: "Events")
    ]
}
