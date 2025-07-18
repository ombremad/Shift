//
//  ForumTagCard.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

struct ForumTagCard : View {
    
    var name: String = "Mentorship"
    var icon: ImageResource = .usersThree
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.violet)
                .cornerRadius(15)
                .frame(width: 80, height: 80)
            VStack {
                Image(icon)
                Text(name)
                    .font(.custom("HelveticaNeue", size: 13))
            }
            .foregroundStyle(.blanc)
        }
    }
}

#Preview {
    ForumTagCard()
}
