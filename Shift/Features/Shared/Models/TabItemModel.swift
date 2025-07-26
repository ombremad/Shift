//
//  TabItemModel.swift
//  Shift
//
//  Created by Samara Lima da Silva on 25/07/2025.
//

import Foundation

struct TabItem {
    let id = UUID()
    let tab: Tab
    let icon: String
    let title: String
}


enum Tab {
    case inspirations, articles, dashboard, forum, events
}
