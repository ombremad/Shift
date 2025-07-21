//
//  ForumView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct ForumView: View {

    @State var forumViewModel = ForumViewModel()
    
    func header() -> some View {
        HStack {
            Text("Forum")
                .font(.custom("Safiro-SemiBold", size: 36))
                .foregroundStyle(.noir)
            Spacer()
            ZStack {
                Circle()
                    .fill(.neonGreen)
                    .frame(width:44, height:44)
                Image(.magnifyingGlass)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26)
                    .foregroundStyle(.black)
            }
            NavigationLink(destination: ForumNewPostView().environment(forumViewModel)) {
                ZStack {
                    Circle()
                        .fill(.neonGreen)
                        .frame(width:44, height:44)
                    Image(.plus)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26)
                        .foregroundStyle(.black)
                }
            }
        }
        .frame(height: 44)
        .padding(.horizontal)
    }
    func categories() -> some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(.custom("Safiro-SemiBold", size: 22))
                .foregroundStyle(.noir)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(forumViewModel.tags) { tag in
                        ForumTagCard(tag: tag)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    func latest() -> some View {
        VStack(alignment: .leading) {
            Text("Latest")
                .font(.custom("Safiro-SemiBold", size: 22))
                .foregroundStyle(.noir)
            VStack(spacing: 15) {
                ForEach (forumViewModel.posts) { post in
                    NavigationLink(destination: ForumSingleView(post: post)) {
                        ForumCard(post: post)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 25) {
                        header()
                        categories()
                        latest()
                    }
                }
            }
            .navigationTitle("Forum")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ForumView()
}
