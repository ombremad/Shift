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
            Spacer()
            ZStack {
                Circle()
                    .fill(.neonGreen)
                    .frame(width:44, height:44)
                Image(.magnifyingGlass)
                    .resizable()
                    .frame(width: 22, height: 22)
                    .scaledToFit()
                    .foregroundStyle(.noir)
            }
            ZStack {
                Circle()
                    .fill(.neonGreen)
                    .frame(width:44, height:44)
                Image(.plus)
                    .resizable()
                    .frame(width: 22, height: 22)
                    .scaledToFit()
                    .foregroundStyle(.noir)
            }
        }
    }
    func categories() -> some View {
        VStack {
            HStack {
                Text("Categories")
                    .font(.custom("Safiro-SemiBold", size: 22))
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(forumViewModel.tags) { tag in
                        ForumTagCard(name: tag.name, icon: tag.icon)
                    }
                }
            }
        }
    }
    func latest() -> some View {
        VStack {
            HStack {
                Text("Latest")
                    .font(.custom("Safiro-SemiBold", size: 22))
                Spacer()
            }
            VStack {
                ForEach (forumViewModel.posts) { post in
                    ForumCard(
                        title: post.title,
                        content: post.content,
                        numberOfComments: post.numberOfComments,
                        numberOfLikes: post.numberOfLikes,
                        isHot: post.isHot,
                        tags: post.tags
                    )
                }
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                    .ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 15) {
                        header()
                        categories()
                        latest()
                    }
                    .padding()
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
