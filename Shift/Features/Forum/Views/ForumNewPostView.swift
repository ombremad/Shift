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
    @State private var noTagAlert: Bool = false
    
    @State var user: User
    
    func postHeader() -> some View {
        VStack(alignment: .leading) {
            Text("New Post")
                .font(.custom("Safiro-SemiBold", size: 36))
            HStack {
                Image(user.picture)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .clipShape(.circle)
                VStack(alignment: .leading) {
                    Text(user.nickname)
                        .font(.custom("Safiro-SemiBold", size: 14))
                    Text(user.city)
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
                    ForEach(forumViewModel.tags) { tag in
                        ForumTagCard(tag: tag)
                            .onTapGesture {
                                tag.toggle()
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .foregroundStyle(.noir)
        .onAppear {
            forumViewModel.resetToggledTags()
        }
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
        ZStack {
            Color.background
                .ignoresSafeArea()
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        postHeader()
                        postTitle()
                        postCategories()
                        postDescription()
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                        .font(.custom("HelveticaNeue-SemiBold", size: 16))
                        .foregroundStyle(.violet)
                        .onTapGesture {
                            dismiss()
                        }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Text("Send")
                            .font(.custom("HelveticaNeue-Bold", size: 14))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .frame(height: 40)
                            .background(.violet)
                            .cornerRadius(5)
                            .onTapGesture {
                                if forumViewModel.getToggledTags().isEmpty {
                                    noTagAlert.toggle()
                                } else {
                                    forumViewModel.setNewPost(title: title, content: description, user: user, tags: forumViewModel.getToggledTags())
                                    forumViewModel.resetToggledTags()
                                    dismiss()
                                }
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .alert("Please select at least one category.", isPresented: $noTagAlert) {
                        Button("OK", role: .cancel) {
                            noTagAlert.toggle()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ForumNewPostView(user: User(name: "Julie", nickname: "julie_la_codeuse", picture: .profile, city: "Montreuil", interests: [fieldOfInterests.uxui]
    )).environment(ForumViewModel())
}
