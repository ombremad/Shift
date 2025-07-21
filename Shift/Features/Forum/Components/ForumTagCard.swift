//
//  ForumTagCard.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

struct ForumTagCard : View {
    
    var tag: Tag
    var isToggled: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isToggled ? .neonGreen : .violet)
                .cornerRadius(15)
                .frame(width: 80, height: 80)
            VStack {
                Image(tag.icon)
                Text(tag.name)
                    .font(.custom("HelveticaNeue", size: 13))
                    .frame(width: 80)
                    .allowsTightening(true)
            }
            .foregroundStyle(isToggled ? .black : .white)
        }
    }
}

#Preview {
    ForumTagCard(tag: Tag(name: "Mentorship", icon: .usersThree))
}
