//
//  ForumSingleView.swift
//  Shift
//
//  Created by Anne Ferret on 18/07/2025.
//

import SwiftUI

struct ForumSingleView: View {
    @Environment(\.dismiss) private var dismiss

    var currentUser : User
    @State private var showReply : Bool = false
    @State private var description: String = ""
    
    var post: Post
    
    func forumSingle() -> some View {
        ZStack {
            Rectangle()
                .fill(.blanc)
                .cornerRadius(15)
                .shadow(color: .noir.opacity(0.20), radius: 2, x: 0, y: 2)
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Image(post.user.picture)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 44, height: 44)
                        .clipShape(.circle)
                    VStack(alignment: .leading) {
                        Text(post.user.nickname)
                            .font(.custom("Safiro-SemiBold", size: 14))
                        Text(post.user.city)
                            .font(.custom("Safiro-Regular", size: 12))
                    }
                    Spacer()
                }
                Text(post.title)
                    .font(.custom("Safiro-SemiBold", size: 22))
                HStack {
                    ForEach (post.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.custom("Safiro-SemiBold", size: 12))
                            .padding(.vertical, 2)
                            .padding(.horizontal, 10)
                            .frame(height: 24)
                            .foregroundStyle(.black)
                            .background(.neonGreen)
                            .cornerRadius(5)
                    }
                }
                Text(post.content)
                    .font(.custom("HelveticaNeue", size: 14))
                HStack {
                    HStack {
                        Image(.arrowBendUpLeft)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Reply")
                    }
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(height: 40)
                        .background(.violet)
                        .cornerRadius(5)
                        .onTapGesture {
                            showReply.toggle()
                        }
                    HStack {
                        Image(.thumbsUp)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text(post.numberOfLikes.description)
                    }
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundStyle(post.likedByUser ? .black : .white)
                        .padding(10)
                        .frame(height: 40)
                        .background(post.likedByUser ? .neonGreen : .violet)
                        .cornerRadius(5)
                        .onTapGesture {
                            post.like()
                        }
                }
                    forumReply()
                        .frame(height: showReply ? nil : 0)
                        .clipped()
                        .opacity(showReply ? 1 : 0)
                        .animation(.easeInOut(duration: 0.3), value: showReply)
            }
            .padding()
        }
    }
    func forumAnswers() -> some View {
        VStack(alignment: .leading) {
            if post.comments.isEmpty {
                HStack {
                    Text("No answers (yet). Will you be the first?")
                        .font(.custom("Safiro-SemiBold", size: 16))
                    Spacer()
                }
            } else {
                Text(post.comments.count == 1 ? "One answer" : "\(post.comments.count) answers")
                    .font(.custom("Safiro-SemiBold", size: 16))
                ForEach(post.comments.reversed()) { comment in
                    ZStack {
                        Rectangle()
                            .fill(.blanc)
                            .cornerRadius(15)
                            .shadow(color: .noir.opacity(0.20), radius: 2, x: 0, y: 2)
                        VStack(alignment: .leading, spacing: 15) {
                            HStack {
                                Image(comment.user.picture)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 44, height: 44)
                                    .clipShape(.circle)
                                VStack(alignment: .leading) {
                                    Text(comment.user.nickname)
                                        .font(.custom("Safiro-SemiBold", size: 14))
                                    Text(comment.user.city)
                                        .font(.custom("Safiro-Regular", size: 12))
                                }
                                Spacer()
                            }
                            Text(comment.content)
                                .font(.custom("HelveticaNeue", size: 14))
                            HStack {
//      TODO: Here. Threaded comments if we have the time.
//                                HStack {
//                                    Image(.arrowBendUpLeft)
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                    Text("Reply")
//                                }
//                                    .font(.custom("HelveticaNeue-Bold", size: 14))
//                                    .foregroundStyle(.white)
//                                    .padding(10)
//                                    .frame(height: 40)
//                                    .background(.violet)
//                                    .cornerRadius(5)
                                HStack {
                                    Image(.thumbsUp)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text(comment.numberOfLikes.description)
                                }
                                    .font(.custom("HelveticaNeue-Bold", size: 14))
                                    .foregroundStyle(comment.likedByUser ? .black : .white)
                                    .padding(10)
                                    .frame(height: 40)
                                    .background(comment.likedByUser ? .neonGreen : .violet)
                                    .cornerRadius(5)
                                    .onTapGesture {
                                        comment.like()
                                    }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
    func forumReply() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.03))
                .stroke(.noir.opacity(0.3))
            VStack {
                TextField("Your message", text: $description, axis: .vertical)
                    .lineLimit(3, reservesSpace: true)
                    .font(.custom("HelveticaNeue", size: 14))
                HStack {
                    Spacer()
                    Text("Cancel")
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(width: 118, height: 40)
                        .background(.gray.opacity(0.5))
                        .cornerRadius(10)
                        .onTapGesture {
                            showReply.toggle()
                        }
                    Text("Send")
                        .font(.custom("HelveticaNeue-Bold", size: 14))
                        .foregroundStyle(.white)
                        .padding(10)
                        .frame(width: 118, height: 40)
                        .background(.violet)
                        .cornerRadius(10)
                        .onTapGesture {
                            post.comments.append(Comment(content: description, postedOn: Date(), user: currentUser, numberOfLikes: 0, nestedLevel: 0))
                            description = ""
                            showReply.toggle()
                        }
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
        }
        .frame(height: 120)
    }
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 25) {
                    //                    header()
                    forumSingle()
                    forumAnswers()
                }
                .padding()
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                        .font(.custom("HelveticaNeue-SemiBold", size: 16))
                        .foregroundStyle(.violet)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
        }
    }
}

#Preview {
    ForumSingleView(currentUser: User(name: "Julie",
        nickname: "julie_la_codeuse",
        picture: .profile,
        city: "Montreuil",
        interests: [fieldOfInterests.uxui]
    ), post: Post (
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
        numberOfLikes: 42,
        likedByUser: false,
        isHot: true,
        tags: ["Tech talk"],
        comments: [
            Comment(content: "I agree, wholeheartedly! My heart is with you, Viviane. My head hurts everytime I have to go back to UIKit 😭", postedOn: Date(), user: User(name: "Julie",nickname: "julie_la_codeuse",picture: .profile, city: "Montreuil",interests: [fieldOfInterests.uxui]), numberOfLikes: 3, nestedLevel: 0),
            Comment(content: "UIKIT SUCKSSSSSSS", postedOn: Date(), user: User(name: "Julie",nickname: "julie_la_codeuse",picture: .profile, city: "Montreuil",interests: [fieldOfInterests.uxui]), numberOfLikes: 0, nestedLevel: 0),
        ]
    ))
}
