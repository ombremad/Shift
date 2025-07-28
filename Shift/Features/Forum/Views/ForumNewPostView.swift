//
//  ForumNewPostView.swift
//  Shift
//
//  Created by Anne Ferret on 21/07/2025.
//

import SwiftUI

struct ForumNewPostView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(ForumViewModel.self) var forumViewModel
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedTags: [String] = []
    
    func header() -> some View {
        HStack {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
                .font(.custom("HelveticaNeue", size: 16))
                .foregroundStyle(.violet)
                .onTapGesture {
                    dismiss()
                }
            Spacer()
            Text("Send")
                .font(.custom("HelveticaNeue-Bold", size: 14))
                .foregroundStyle(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .frame(height: 40)
                .background(.violet)
                .cornerRadius(5)
                .onTapGesture {
                    if !selectedTags.isEmpty {
                        forumViewModel.setNewPost(title: title, content: description, user: forumViewModel.user.getCurrentUser(), tags: selectedTags)
                        dismiss()
                    }
                }
        }
        .frame(height: 44)
        .padding(.horizontal)
    }
    func postHeader() -> some View {
        VStack(alignment: .leading) {
            Text("New Post")
                .font(.custom("Safiro-SemiBold", size: 36))
            HStack {
                Image(forumViewModel.user.getCurrentUser().picture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .clipShape(.circle)
                VStack(alignment: .leading) {
                    Text(forumViewModel.user.getCurrentUser().nickname)
                        .font(.custom("Safiro-SemiBold", size: 14))
                    Text(forumViewModel.user.getCurrentUser().city)
                        .font(.custom("Safiro-Regular", size: 12))
                }
                Spacer()
            }
        }
        .foregroundStyle(.noir)
        .padding(.horizontal)
    }
    func postTitle() -> some View {
        VStack(alignment: .leading) {
            Text("Post title")
                .font(.custom("Safiro-SemiBold", size: 16))
            TextField("Enter your post title", text: $title)
                .font(.custom("HelveticaNeue", size: 14))
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(.blanc)
                .cornerRadius(10)
        }
        .foregroundStyle(.noir)
        .padding(.horizontal)
    }
    func postCategories() -> some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(.custom("Safiro-SemiBold", size: 16))
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    // TODO: Remove unselected tags and color them based on toggled
                    ForEach(forumViewModel.tags) { tag in
                        ForumTagCard(tag: tag)
                            .onTapGesture {
                                selectedTags.append(tag.name)
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .foregroundStyle(.noir)
    }
    func postDescription() -> some View {
        VStack(alignment: .leading) {
            Text("Post description")
                .font(.custom("Safiro-SemiBold", size: 16))
            TextField("Enter your post description", text: $description, axis: .vertical)
                .lineLimit(12, reservesSpace: true)
                .font(.custom("HelveticaNeue", size: 14))
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(.blanc)
                .foregroundStyle(.noir)
                .cornerRadius(10)
        }
        .foregroundStyle(.noir)
        .padding(.horizontal)
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        header()
                        postHeader()
                        postTitle()
                        postCategories()
                        postDescription()
                    }
                }
            }
            .navigationTitle("New post")
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ForumNewPostView().environment(ForumViewModel())
}
