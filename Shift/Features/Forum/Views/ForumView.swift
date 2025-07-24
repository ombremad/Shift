//
//  ForumView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 15/07/2025.
//

import SwiftUI

struct ForumView: View {
    @State var forumViewModel = ForumViewModel()
    @State private var showSearchField : Bool = false
    @State private var searchField : String = ""
    @State private var toggledTags : [String] = []
    @State private var searchResults : [Post] = []
    
    private func submitSearch(_ text: String) {
        forumViewModel.resetToggledTags()
        toggledTags = forumViewModel.getToggledTags()
        searchResults = forumViewModel.getSearchResults(text)
    }
    
    func header() -> some View {
        HStack {
            Text("Forum")
                .font(.custom("Safiro-SemiBold", size: 36))
                .foregroundStyle(.noir)
            Spacer()
            ZStack {
                Circle()
                    .fill(showSearchField ? .violet : .neonGreen)
                    .frame(width:44, height:44)
                Image(.magnifyingGlass)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26)
                    .foregroundStyle(showSearchField ? .white :.black)
            }
            .onTapGesture {
                showSearchField.toggle()
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
    func searchBar() -> some View {
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
    func categoriesSelector() -> some View {
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
                                showSearchField = false
                                searchField = ""
                                searchResults = []
                                tag.toggle()
                                toggledTags = forumViewModel.getToggledTags()
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
    func hotPosts() -> some View {
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
    func latestPosts() -> some View {
        VStack(alignment: .leading) {
            Text("Latest")
                .font(.custom("Safiro-SemiBold", size: 22))
                .foregroundStyle(.noir)
                .frame(height: 40)
            VStack(spacing: 15) {
                ForEach (forumViewModel.getLatestPosts()) { post in
                    NavigationLink(destination: ForumSingleView(currentUser: forumViewModel.user.getCurrentUser(), post: post)) {
                        ForumCard(post: post)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    func categoriesResultPosts() -> some View {
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
                        toggledTags = forumViewModel.getToggledTags()
                    }
            }
            .frame(height: 40)
            VStack(spacing: 15) {
                if forumViewModel.getFilteredPosts(categories: toggledTags).isEmpty {
                    Text("No results found")
                        .font(.custom("HelveticaNeue", size: 14))
                        .foregroundStyle(.black)
                } else {
                    ForEach (forumViewModel.getFilteredPosts(categories: toggledTags).reversed()) { post in
                        NavigationLink(destination: ForumSingleView(currentUser: forumViewModel.user.getCurrentUser(), post: post)) {
                            ForumCard(post: post)
                        }
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    func searchResultPosts() -> some View {
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
                        forumViewModel.resetToggledTags()
                        toggledTags = forumViewModel.getToggledTags()
                        searchResults = forumViewModel.getSearchResults("")
                    }
            }
            .frame(height: 40)
            VStack(spacing: 15) {
                    ForEach (forumViewModel.getSearchResults(searchField).reversed()) { post in
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
                        if showSearchField {
                            searchBar()
                        }
                        categoriesSelector()
                        if toggledTags.isEmpty && searchResults.isEmpty {
                            hotPosts()
                            latestPosts()
                        } else if !toggledTags.isEmpty {
                            categoriesResultPosts()
                        } else if !searchResults.isEmpty {
                            searchResultPosts()
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
