//
//  ForumTagCard.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

struct ForumTagCard : View {
    
    var tag: Tag
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.violet)
                .cornerRadius(15)
                .frame(width: 80, height: 80)
            VStack {
                Image(tag.icon)
                Text(tag.name)
                    .font(.custom("HelveticaNeue", size: 13))
                    .frame(width: 80)
                    .allowsTightening(true)
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    ForumTagCard(tag: Tag(
        name: "Mentorship",
        icon: .usersThree
        )
    )
}
