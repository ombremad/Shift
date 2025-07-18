//
//  ForumCard.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

struct ForumCard: View {
    
    var title: String = "Who else loves SwiftUI around here?"
    var content: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam auctor quam id massa faucibus dignissim. Nullam eget metus id nisl malesuada condimentum. Nam viverra fringilla erat, ut fermentum nunc feugiat eu."
    var numberOfComments: UInt8 = 12
    var numberOfLikes: UInt8 = 42
    var tags: [String] = ["hot", "mentorship", "support", "more", "and even more"]
    
var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.20), radius: 2, x: 0, y: 2)
            VStack(alignment:.leading) {
                Text(title)
                    .font(.custom("Safiro-SemiBold", size: 16))
                    .lineLimit(1)
                Text(content)
                    .font(.custom("HelveticaNeue", size: 14))
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                Spacer()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        HStack {
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
                                ForEach (tags, id: \.self) { tag in
                                    Text(tag)
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
            .padding()
        }
        .frame(height: 134)
    }
}

#Preview {
    ForumCard()
}
