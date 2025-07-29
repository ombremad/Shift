//
//  HotTopicsView.swift
//  Shift
//
//  Created by Samara Lima da Silva on 28/07/2025.
//

import SwiftUI

struct HotTopicsView: View {
    @State var forumViewModel = ForumViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            let hotPosts = forumViewModel.getHotPosts()
            
            ForEach(hotPosts) { post in
                NavigationLink(
                    destination: ForumSingleView(
                        currentUser: forumViewModel.user.getCurrentUser(),
                        post: post
                    )
                ) {
                    ForumCard(
                        post: post,
                        backgroundColor: Color(.violet),
                        textColor: .white
                    )
                    .frame(width: 371, height: 122)
                }
            }
        }
        .padding(.vertical, 15)
        .padding(.bottom, 40)
    }
}

#Preview {
    HotTopicsView()
}
