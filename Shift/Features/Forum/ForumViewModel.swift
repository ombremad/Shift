//
//  ForumViewModel.swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import SwiftUI

@Observable
final class ForumViewModel {
    
    let tags : [Tag] = [
        Tag(name: "Mentorship", icon: .usersThree),
        Tag(name: "Support", icon: .lifebuoy),
        Tag(name: "Training", icon: .atom),
        Tag(name: "Stories", icon: .chatDots),
        Tag(name: "Networking", icon: .sparkle)
    ]
    
    var posts : [Post] = [
        Post (
        title: "Who else here is loving SwiftUI? 🚀",
        content: """
            Hey everyone!
            I've been working with SwiftUI for about 8 months now after years of struggling with UIKit, and I'm honestly having the best time coding I've had in ages. The declarative syntax just clicks with how I think about UI design, and being able to see live previews while I'm building components has been a game-changer for my workflow. I know there are still some limitations and quirks (don't get me started on navigation in complex apps 😅), but the rapid development cycle and how intuitive it feels has made me fall in love with iOS development all over again. Plus, the accessibility features are so much easier to implement properly!
            I'm curious - for those of you who've made the switch, what's been your favorite SwiftUI feature? And for anyone still on the fence, what's holding you back? I'd love to hear about your experiences, especially if you've had to convince your team or management to adopt it. Currently working on a side project that's 100% SwiftUI and it's been such a joy compared to the mixed UIKit/SwiftUI codebase at my day job. Anyone else finding themselves reaching for SwiftUI by default now?
            Hope everyone's having a great week! 💙
            """,
        postedOn: Date(),
        author: "Viviane",
        authorCity: "New York City",
        authorProfilePicture: .viviane,
        numberOfComments: 12,
        numberOfLikes: 42,
        isHot: true,
        tags: ["Stories"]
    ),
        Post (
        title: "Offering mentorship for beginners",
        content: """
            Hi everyone, I'm a senior software engineer with 8 years of experience, and I'd like to offer mentorship to women who are starting their tech careers or looking to make a career change into tech.
            I've worked across different areas - web development, mobile apps, and some DevOps - so I can provide guidance on technical skills, interview prep, navigating workplace dynamics, and career planning. I'm also happy to do resume reviews or mock interviews.
            I know how challenging it can be to break into this field, especially as a woman, and I remember how much having a mentor helped me when I was starting out. I'd love to pay it forward.
            If you're interested, feel free to answer with some public contact info, like your WhatsApp or Signal username. I'm thinking we could do monthly video calls or whatever works best for your schedule. No charge, of course - just want to help support more women in tech. 👊
            Looking forward to connecting with some of you!
            Best,
            Sarah
            """,
        postedOn: Date(),
        author: "TechMentorSarah",
        authorCity: "Paris",
        authorProfilePicture: .sarah,
        numberOfComments: 4,
        numberOfLikes: 108,
        isHot: true,
        tags: ["Mentorship", "Support"]
    )
    ]
}
