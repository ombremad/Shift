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
    
var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 1)
            VStack(alignment:.leading) {
                Text(title)
                    .font(.custom("Safiro-SemiBold", size: 16))
                    .lineLimit(1)
                Text(content)
                    .font(.custom("HelveticaNeue", size: 14))
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                Spacer()
                HStack {
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
