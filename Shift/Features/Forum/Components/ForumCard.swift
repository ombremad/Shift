//
//  ForumCard.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

struct ForumCard: View {
    
    var post: Post
    
var body: some View {
        ZStack {
            Rectangle()
                .fill(.blanc)
                .cornerRadius(15)
                .shadow(color: .noir.opacity(0.20), radius: 2, x: 0, y: 2)
            VStack(alignment:.leading, spacing: 10) {
                Text(post.title)
                    .font(.custom("Safiro-SemiBold", size: 16))
                    .lineLimit(1)
                    .allowsTightening(true)
                    .padding(.horizontal)
                Text(post.content)
                    .font(.custom("HelveticaNeue", size: 14))
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        HStack(spacing: 5) {
                            Image(.chatTeardrop)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(.noir)
                                .scaledToFit()
                            Text(post.numberOfComments.description)
                                .foregroundStyle(.noir)
                        }
                        HStack {
                            Image(.thumbsUp)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .scaledToFit()
                            Text(post.numberOfLikes.description)
                        }
                            HStack(spacing: 10) {
                                if post.isHot {
                                    HStack(spacing: 3) {
                                        Image(.fire)
                                            .resizable()
                                            .frame(width: 16, height: 16)
                                            .scaledToFit()
                                        Text("hot").textCase(.lowercase)
                                            .font(.custom("Safiro-SemiBold", size: 12))
                                    }
                                    .padding(.vertical, 2)
                                    .padding(.leading, 7)
                                    .padding(.trailing, 10)
                                    .frame(height: 24)
                                    .foregroundStyle(.black)
                                    .background(.neonGreen)
                                    .cornerRadius(5)
                                }
                                ForEach (post.tags, id: \.self) { tag in
                                    Text(tag).textCase(.lowercase)
                                        .font(.custom("Safiro-SemiBold", size: 12))
                                        .padding(.vertical, 2)
                                        .padding(.horizontal, 10)
                                        .frame(height: 24)
                                        .foregroundStyle(.black)
                                        .background(.neonGreen)
                                        .cornerRadius(5)
                                }
                            }
                        }
                    .padding(.horizontal)
                }
                .font(.custom("HelveticaNeue-Bold", size: 12))
            }
            .padding(.vertical, 0)
            .foregroundStyle(.noir)
        }
        .frame(height: 140)
    }
}

#Preview {
    ForumCard(post: Post (
        title: "Who else is loving SwiftUI? 🚀",
        content: """
            Hey everyone!
            I've been working with SwiftUI for about 8 months now after years of struggling with UIKit, and I'm honestly having the best time coding I've had in ages. The declarative syntax just clicks with how I think about UI design, and being able to see live previews while I'm building components has been a game-changer for my workflow. I know there are still some limitations and quirks (don't get me started on navigation in complex apps 😅), but the rapid development cycle and how intuitive it feels has made me fall in love with iOS development all over again. Plus, the accessibility features are so much easier to implement properly!
            I'm curious - for those of you who've made the switch, what's been your favorite SwiftUI feature? And for anyone still on the fence, what's holding you back? I'd love to hear about your experiences, especially if you've had to convince your team or management to adopt it. Currently working on a side project that's 100% SwiftUI and it's been such a joy compared to the mixed UIKit/SwiftUI codebase at my day job. Anyone else finding themselves reaching for SwiftUI by default now?
            Hope everyone's having a great week! 💙
            """,
        postedOn: Date(),
        user: User(
            name: "Viviane",
            nickname: "vivi_a_ne",
            picture: .profile,
            city: "Johannesburg",
            interests: [fieldOfInterests.uxui]
        ),
        numberOfComments: 12,
        numberOfLikes: 42,
        isHot: true,
        tags: ["Tech talk"]
    ))
}
