//
//  TabBarView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var viewModel = TabBarViewModel()
    @Environment(UserModel.self) var userModel

    var body: some View {
        VStack(spacing: -12) {
            // MARK: - Main content area
            ZStack {
                switch viewModel.selectedTab {
                case .inspirations:
                    InspirationsView()
                case .articles:
                    ArticlesView()
                case .dashboard:
                    DashboardView()
                case .forum:
                    ForumView()
                case .events:
                    EventsView()
                }
            }

            // MARK: - Custom Tab Bar
            HStack {
                ForEach(viewModel.tabs, id: \.id) { item in
                    tabBarItem(item: item)
                }
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, maxHeight: 84)
            .background(.blanc.opacity(0.90))
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.4), radius: 0.7, x: 0, y: 0)
        }
        .edgesIgnoringSafeArea(.bottom)
    }

    private func tabBarItem(item: TabItem) -> some View {
        Button(action: {
            viewModel.selectedTab = item.tab
        }) {
            VStack() {
                Image(item.icon)
                    .font(.system(size: 23, weight: .regular))
                    .foregroundColor(viewModel.selectedTab == item.tab ? Color("Violet") : .gray)
                Text(item.title)
                    .font(.custom("HelveticaNeue", size: 10))
                    .foregroundColor(viewModel.selectedTab == item.tab ? Color("Violet") : .gray)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 10)
            .padding(.bottom, 34)
        }
    }
}

#Preview {
    TabBarView().environment(UserModel())
}
