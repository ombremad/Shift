//
//  ForumSingleView.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

struct ForumSingleView: View {
    @Environment(\.dismiss) private var dismiss
    
    var post: Post
    
    func header() -> some View {
        HStack {
            HStack {
                Image(systemName: "chevron.left")
                Text("Forum")
            }
                .font(.custom("HelveticaNeue", size: 18))
                .onTapGesture {
                    dismiss()
                }
            Spacer()
        }
        .frame(height: 44)
    }
    func forumSingle() -> some View {
        VStack {
            Text(post.title)
            Text("TODO ON MONDAY!")   // TODO: Continue here on Monday
        }
    }

    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 15) {
                    header()
                    forumSingle()
                }
            }
            .padding()
        }
        .navigationTitle(post.title)
        .navigationBarHidden(true)
    }
}

#Preview {
    ForumSingleView(post: Post (title: "Who else here is loving SwiftUI? 🚀", content: """
Hey everyone!
I've been working with SwiftUI for about 8 months now after years of struggling with UIKit, and I'm honestly having the best time coding I've had in ages. The declarative syntax just clicks with how I think about UI design, and being able to see live previews while I'm building components has been a game-changer for my workflow. I know there are still some limitations and quirks (don't get me started on navigation in complex apps 😅), but the rapid development cycle and how intuitive it feels has made me fall in love with iOS development all over again. Plus, the accessibility features are so much easier to implement properly!
I'm curious - for those of you who've made the switch, what's been your favorite SwiftUI feature? And for anyone still on the fence, what's holding you back? I'd love to hear about your experiences, especially if you've had to convince your team or management to adopt it. Currently working on a side project that's 100% SwiftUI and it's been such a joy compared to the mixed UIKit/SwiftUI codebase at my day job. Anyone else finding themselves reaching for SwiftUI by default now?
Hope everyone's having a great week! 💙
""", postedOn: Date(), author: "Viviane", authorCity: "Johannesburg", authorProfilePicture: .viviane, numberOfComments: 12, numberOfLikes: 42, isHot: true, tags: ["Tech talk"]))
}
