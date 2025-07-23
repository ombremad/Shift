//
//  ForumView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct ForumView: View {
    @State var forumViewModel = ForumViewModel()
    @State var filteredTags : [String] = []
    
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
                            .onTapGesture {
                                tag.toggle()
                                filteredTags = forumViewModel.getToggledTags()
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            forumViewModel.resetToggledTags()
        }
    }
    func latest() -> some View {
        VStack(alignment: .leading) {
            Text("Latest")
                .font(.custom("Safiro-SemiBold", size: 22))
                .foregroundStyle(.noir)
            VStack(spacing: 15) {
                ForEach (forumViewModel.posts.reversed()) { post in
                    NavigationLink(destination: ForumSingleView(currentUser: forumViewModel.user.getCurrentUser(), post: post)) {
                        ForumCard(post: post)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    func filtered() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Filter results")
                    .font(.custom("Safiro-SemiBold", size: 22))
                    .foregroundStyle(.noir)
                Spacer()
                Text("Reset")
                    .font(.custom("HelveticaNeue-Bold", size: 14))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .frame(height: 40)
                    .background(.violet)
                    .cornerRadius(5)
                    .onTapGesture {
                        forumViewModel.resetToggledTags()
                        filteredTags = forumViewModel.getToggledTags()
                    }
            }
            VStack(spacing: 15) {
                ForEach (forumViewModel.getFilteredPosts(categories: filteredTags).reversed()) { post in
                    NavigationLink(destination: ForumSingleView(currentUser: forumViewModel.user.getCurrentUser(), post: post)) {
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
                        if filteredTags.isEmpty {
                            latest()
                        } else {
                            filtered()
                        }
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
