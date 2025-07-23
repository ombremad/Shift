//
//  ForumView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct ForumView: View {
    @State var forumViewModel = ForumViewModel()
    @State private var filteredTags : [String] = []
    @State private var showSearch : Bool = false
    @State private var searchField : String = ""
    @State private var searchResults : [Post] = []
    
    private func submitSearch(_ text: String) {
        searchResults = forumViewModel.getSearchedPosts(searchField)
    }
    
    func header() -> some View {
        HStack {
            Text("Forum")
                .font(.custom("Safiro-SemiBold", size: 36))
                .foregroundStyle(.noir)
            Spacer()
            ZStack {
                Circle()
                    .fill(showSearch ? .violet : .neonGreen)
                    .frame(width:44, height:44)
                Image(.magnifyingGlass)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26)
                    .foregroundStyle(showSearch ? .white :.black)
            }
            .onTapGesture {
                showSearch.toggle()
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
    func search() -> some View {
        ZStack {
            Rectangle()
                .fill(.blanc)
                .cornerRadius(10)
            HStack {
                TextField("What do you want to search?", text: $searchField)
                    .font(.custom("HelveticaNeue", size: 14))
                    .foregroundStyle(.noir)
                    .onSubmit {
                        submitSearch(searchField)
                    }
                Image(.arrowCircleRight)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.violet)
                    .onTapGesture {
                        submitSearch(searchField)
                    }
            }
            .frame(height: 30)
            .padding(.horizontal)
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
                                showSearch = false
                                searchField = ""
                                searchResults = []
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
    func hot() -> some View {
        VStack(alignment: .leading) {
            Text("Hot posts")
                .font(.custom("Safiro-SemiBold", size: 22))
                .foregroundStyle(.noir)
                .frame(height: 40)
            VStack(spacing: 15) {
                ForEach (forumViewModel.getHotPosts()) { post in
                    NavigationLink(destination: ForumSingleView(currentUser: forumViewModel.user.getCurrentUser(), post: post)) {
                        ForumCard(post: post)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    func latest() -> some View {
        VStack(alignment: .leading) {
            Text("Latest")
                .font(.custom("Safiro-SemiBold", size: 22))
                .foregroundStyle(.noir)
                .frame(height: 40)
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
            .frame(height: 40)
            VStack(spacing: 15) {
                if forumViewModel.getFilteredPosts(categories: filteredTags).isEmpty {
                    Text("No results found")
                        .font(.custom("HelveticaNeue", size: 14))
                        .foregroundStyle(.black)
                } else {
                    ForEach (forumViewModel.getFilteredPosts(categories: filteredTags).reversed()) { post in
                        NavigationLink(destination: ForumSingleView(currentUser: forumViewModel.user.getCurrentUser(), post: post)) {
                            ForumCard(post: post)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    func searched() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Search results for " + searchField)
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
                        searchField = ""
                        searchResults = []
                    }
            }
            .frame(height: 40)
            VStack(spacing: 15) {
                if forumViewModel.getSearchedPosts(searchField).isEmpty {
                    Text("No results found")
                        .font(.custom("HelveticaNeue", size: 14))
                        .foregroundStyle(.black)
                } else {
                    ForEach (forumViewModel.getSearchedPosts(searchField).reversed()) { post in
                        NavigationLink(destination: ForumSingleView(currentUser: forumViewModel.user.getCurrentUser(), post: post)) {
                            ForumCard(post: post)
                        }
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
                        if showSearch {
                            search()
                        }
                        categories()
                        if filteredTags.isEmpty && searchResults.isEmpty {
                            hot()
                            latest()
                        } else if !filteredTags.isEmpty {
                            filtered()
                        } else if !searchResults.isEmpty {
                            searched()
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
