//
//  ForumCard.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

struct ForumCard: View {
    
    var title: String
    var content: String
    var numberOfComments: UInt8
    var numberOfLikes: UInt8
    var isHot: Bool
    var tags: [String]
    
var body: some View {
        ZStack {
            Rectangle()
                .fill(.blanc)
                .cornerRadius(15)
                .shadow(color: .noir.opacity(0.20), radius: 2, x: 0, y: 2)
            VStack(alignment:.leading, spacing: 10) {
                Text(title)
                    .font(.custom("Safiro-SemiBold", size: 16))
                    .lineLimit(1)
                Text(content)
                    .font(.custom("HelveticaNeue", size: 14))
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        HStack(spacing: 5) {
                            Image(.chatTeardrop)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .scaledToFit()
                            Text(numberOfComments.description)
                        }
                        HStack {
                            Image(.thumbsUp)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .scaledToFit()
                            Text(numberOfLikes.description)
                        }
                            HStack(spacing: 10) {
                                if isHot {
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
                                    .background(.neonGreen)
                                    .cornerRadius(5)
                                }
                                ForEach (tags, id: \.self) { tag in
                                    Text(tag).textCase(.lowercase)
                                        .font(.custom("Safiro-SemiBold", size: 12))
                                        .padding(.vertical, 2)
                                        .padding(.horizontal, 10)
                                        .frame(height: 24)
                                        .background(.neonGreen)
                                        .cornerRadius(5)
                                }
                            }
                        }
                }
                .font(.custom("HelveticaNeue-Bold", size: 12))
            }
            .padding(.horizontal)
            .padding(.vertical, 0)
            .foregroundStyle(.noir)
        }
        .frame(height: 140)
    }
}

#Preview {
    ForumCard(
        title: "Who else here is absolutely loving SwiftUI? 🚀",
        content: """
        Hey everyone!
        I've been working with SwiftUI for about 8 months now after years of struggling with UIKit, and I'm honestly having the best time coding I've had in ages. The declarative syntax just clicks with how I think about UI design, and being able to see live previews while I'm building components has been a game-changer for my workflow.
        """,
        numberOfComments: 12,
        numberOfLikes: 42,
        isHot: true,
        tags: ["Support", "Stories"]
    )
}
