//
//  ForumViewModel.swift
//  Shift
//
//  Created by Samara Lima da Silva on 17/07/2025.
//

import SwiftUI

@Observable
final class ForumViewModel {
    
    let user = UserModel()
    
    let tags : [Tag] = [
        Tag(name: "Mentorship", icon: .usersThree),
        Tag(name: "Support", icon: .lifebuoy),
        Tag(name: "Training", icon: .atom),
        Tag(name: "Tech talk", icon: .circuitry),
        Tag(name: "Networking", icon: .sparkle),
        Tag(name: "Stories", icon: .chatDots)
    ]
    
    var posts : [Post] = [
        Post (
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
            picture: .viviane,
            city: "Johannesburg",
            interests: [fieldOfInterests.uxui]
        ),
        numberOfComments: 12,
        numberOfLikes: 42,
        isHot: true,
        tags: ["Tech talk"]
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
        user: User(
            name: "Sarah",
            nickname: "TechMentor Sarah",
            picture: .sarah,
            city: "Paris",
            interests: [
                fieldOfInterests.ai,
                fieldOfInterests.cybersecurity
            ]
        ),
        numberOfComments: 4,
        numberOfLikes: 108,
        isHot: true,
        tags: ["Mentorship", "Support"]
    ),
        Post (
        title: "NYC Tech Ladies Happy Hour? 🍹✨",
        content: """
            Hey gorgeous tech queens! 👑💻
            So I've been thinking... wouldn't it be amazing to get together for some drinks and good vibes? 🥂 I'm thinking of organizing a casual happy hour somewhere in Manhattan - maybe next Friday evening? 🗽
            Nothing too fancy, just us amazing women chatting about code, careers, and life over some well-deserved cocktails! 🍸💃 Whether you're a seasoned dev or just starting your tech journey, ALL are welcome! 🤗
            I'm thinking we could meet at that cute rooftop bar in SoHo around 6pm? 🌆 Perfect for networking without the stuffiness of formal events! Plus they have amazing nachos 🧀😋
            Drop a comment if you're interested and I'll create a group chat to sort out the details! Let's make this happen ladies! 💪✨
            Can't wait to meet you all IRL! 🥳
            xoxo 💋
            """,
        postedOn: Date(),
        user: User(
            name: "Anita",
            nickname: "AniCodeAndCocktails",
            picture: .anita,
            city: "New York City",
            interests: [
                fieldOfInterests.web,
                fieldOfInterests.devops
            ]
        ),
        numberOfComments: 1,
        numberOfLikes: 8,
        isHot: false,
        tags: ["Networking"]
    )
    ]
    
    func setNewPost(title: String, content: String, user: User, tags: [String]) {
        posts.append(Post(title: title, content: content, postedOn: Date(), user: user, numberOfComments: 0, numberOfLikes: 0, isHot: false, tags: tags))
    }
}
